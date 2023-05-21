module "ec2" {
  source = "../../../Modules/Compute/Creation of EC2 Instance (Windows)"
  count  = 2
  instanceType                         = var.instanceType[count.index]
  e2_associate_public_ip_address       = var.e2_associate_public_ip_address
  ec2_sg_ids                           = var.ec2_sg_ids
  subnet_id                            = var.subnet_id
  private_ip                           = var.private_ip
  ec2_key_name                         = var.ec2_key_name
  ec2_user_data                        = var.ec2_user_data
  ec2_data_replace_on_change           = var.ec2_data_replace_on_change
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
  get_password_data                    = var.get_password_data
  launch_template                      = var.launch_template
  capacity_reservation_specification   = var.capacity_reservation_specification
  capacity_reservation_target          = var.capacity_reservation_target
  credit_specification_cpu_credits     = var.credit_specification_cpu_credits
  enclave_options_enabled              = var.enclave_options_enabled
  ephemeral_block_device               = var.ephemeral_block_device
  common_tags                          = var.common_tags
  maintenance_options                  = var.maintenance_options
  ec2_tags                             = merge(local.tags,var.ec2_tags)
  root_block_device                    = var.root_block_device
  ec2_ebs_device                       = var.ec2_ebs_device
  most_recent_ami                      = var.most_recent_ami
  owner_ami                            = var.owner_ami
  ami_filter                           = var.ami_filter
}

locals {
  name_tag_val = join("-",[data.aws_caller_identity.current.account_id,data.aws_availability_zones.az.id])
  tags={Name=local.name_tag_val}
}

/*
module "sg_ec2" {
  source = "../../SecurityGroup"

  tag_value = var.ec2_tags
  sg_vpcid  =
  sg_ports  = ["22", "443", "80", "8080", "1521"]
}
*/