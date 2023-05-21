#----------AWS AMI----------#
data "aws_ami" "aws_ami" {
  most_recent = var.most_recent_ami
  owners      = var.owner_ami

  dynamic "filter" {
    for_each = var.ami_filter
    content {
      name   = filter.value.name
      values = filter.value.values
    }
  }
}
#---------end-AWS AMI----------#


#----------AWS Subnet----------#
data "aws_subnet" "subnet_ec2" {
  id = var.subnet_id
}
#---------end-AWS subnet----------#


#----------ec2 Key pair-----------#
data "aws_key_pair" "key_e2" {
  key_name = var.ec2_key_name
}
#----------end-ec2 Key pair--------#


locals {
  tags = merge(var.ec2_tags, var.common_tags)

  private_ip = (
    var.private_ip == "" ?
    null :
    var.private_ip
  )

  user_data = (
    var.ec2_user_data == "" ?
    null :
    filebase64(var.ec2_user_data)
  )

  encryption=var.hibernation? true:false
}


###################################|-|EC2 Instance|-|########################################
resource "aws_instance" "ec2_instance" {

  ami                                  = data.aws_ami.aws_ami.id
  instance_type                        = var.instanceType
  vpc_security_group_ids               = var.ec2_sg_ids
  subnet_id                            = data.aws_subnet.subnet_ec2.id
  associate_public_ip_address          = var.e2_associate_public_ip_address
  private_ip                           = local.private_ip
  key_name                             = data.aws_key_pair.key_e2.key_name
  tags                                 = merge(var.ec2_tags, var.common_tags)
  user_data                            = local.user_data
  availability_zone                    = var.availability_zone
  cpu_core_count                       = var.cpu_core_count
  cpu_threads_per_core                 = var.cpu_threads_per_core
  disable_api_termination              = var.disable_api_termination
  ebs_optimized                        = var.ebs_optimized
  hibernation                          = var.hibernation
  host_id                              = var.host_id
  iam_instance_profile                 = var.iam_instance_profile
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  ipv6_address_count                   = var.ipv6_address_count
  monitoring                           = var.monitoring
  tenancy                              = var.tenancy

  # NOTE: user_data_base64 Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string
  #user_data_base64                    = var.user_data_base64
  #user_data_replace_on_change         = var.ec2_data_replace_on_change
  #---------------------------------------------------------#

  #---------------------capacity_reservation_specification--------------------------#
   capacity_reservation_specification {
     capacity_reservation_preference = var.capacity_reservation_specification

     dynamic "capacity_reservation_target"{
       for_each = var.capacity_reservation_specification==null?[var.capacity_reservation_target]:[]
       content {
         capacity_reservation_id                  = lookup(capacity_reservation_target.value,"capacity_reservation_id",null)
         #capacity_reservation_resource_group_arn = lookup(capacity_reservation_target.value,"capacity_reservation_resource_group_arn",null)
         /*
        #Note : capacity_reservation_resource_group_arn  parameter are throwing UNSUPPORTED BLOCK error. Also, the latest aws provider version is crashing
        because of which we are not able to test the script with the latest version of the provider.
        This error may get resolved with new provider version. We have commented the block and the
        parameter for the time being.
          */
       }
     }
  }
  #-----------------end-capacity_reservation_specification--------------------------#

  #---------------------credit_specification----------------------------------------#
  credit_specification {
    cpu_credits = var.credit_specification_cpu_credits
  }
  #-----------------end-credit_specification----------------------------------------#

  #---------------------enclave_options---------------------------------------------#
  enclave_options {
    enabled = var.enclave_options_enabled
  }
  #-----------------end-enclave_options---------------------------------------------#

  #---------------------ephemeral_block_device--------------------------------------#
  dynamic "ephemeral_block_device" {
    for_each = var.ephemeral_block_device
    content {
      device_name  = ephemeral_block_device.value.device_name
      no_device    = ephemeral_block_device.value.no_device
      virtual_name = ephemeral_block_device.value.virtual_name
    }
  }
  #-----------------end-ephemeral_block_device--------------------------------------#

  #---------------------Root block--------------------------------------------------#
  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      volume_type = root_block_device.value.root_volume_type
      volume_size = root_block_device.value.root_volume_size
      encrypted   = local.encryption
      tags        = merge(local.tags, root_block_device.value.root_volume_tags)
    }
  }
  #------------------end-Root block-------------------------------------------------#

  #----------------------ebs block--------------------------------------------------#
  dynamic "ebs_block_device" {
    for_each = var.ec2_ebs_device
    content {
      volume_type = ebs_block_device.value.volume_type
      volume_size = ebs_block_device.value.volume_size
      tags        = merge(local.tags, ebs_block_device.value.tags)
      device_name = ebs_block_device.value.device_name
    }
  }
  #----------------------end-ebs block---------------------------------------------#

  #---------------------launch_template---------------------------------------------#
  dynamic "launch_template" {
    for_each = var.enable_template?[var.launch_template]:[]
    content {
      id      = lookup(launch_template.value,"id",null)
      version = lookup(launch_template.value,"version",null)
    }
  }
  #-----------------end-launch_template---------------------------------------------#

  #---------------------maintenance_options--------------------------#
  /*
    dynamic "maintenance_options" {
      for_each = [var.maintenance_options]
      content {
        auto_recovery = maintenance_options.value.auto_recovery
      }
    }
    */
  /*
   #Note : maintenance_options block are throwing UNSUPPORTED BLOCK error. Also, the latest aws
   provider version is crashing because of which we are not able to test the script with the latest
   version of the provider. This error may get resolved with new provider version. We have commented the block and the
   parameter for the time being.
 */
  #-----------------end-maintenance_options-----------------------------------------#
}

