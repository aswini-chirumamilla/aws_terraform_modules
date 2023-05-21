region                               = "us-east-1"
profile                              = "terraform-practice"
#-------instance------#
instanceType                         = ""
e2_associate_public_ip_address       = false
ec2_sg_ids                           = [] #["sg-11ab4100"] #Security Group ID will come here
subnet_id                            = "subnet-4a5aa806" #"subnet-a7dfa996"
private_ip                           = "172.31.16.4"
ec2_key_name                         = "tf-ec2"
ec2_user_data                        = ""
ec2_data_replace_on_change           = false
availability_zone                    = "us-east-1a"
cpu_core_count                       = null
cpu_threads_per_core                 = null
disable_api_termination              = false
ebs_optimized                        = false
hibernation                          = false
host_id                              = ""
iam_instance_profile                 = ""
instance_initiated_shutdown_behavior = "stop"
ipv6_address_count                   = null
monitoring                           = true
tenancy                              = "default"
enable_template                      = true
launch_template                      = {
  id      = "lt-053b7f28d5de534c7"
  version = "1"
}
capacity_reservation_specification   = null
capacity_reservation_target          = {}
credit_specification_cpu_credits     = null
enclave_options_enabled              = false
ephemeral_block_device               = []
common_tags = {
  name = "ec2"
  env  = "dev"
}
maintenance_options = {
  auto_recovery = "default"
}
ec2_tags = {
  "app1" = "tf-ec2"
}
root_block_device = [
  {
    root_volume_type = "gp3"
    root_volume_size = "30"
    root_volume_tags = {
      FileSystem = "/root"
    }
  }
]
ec2_ebs_device = [
  {
    device_name = "/dev/xvdb"
    tags = {
      FileSystem = "/web/data"
    }
    volume_size = "10"
    volume_type = "gp3"
  },
  {
    device_name = "/dev/xvdc"
    tags = {
      FileSystem = "/web/shared"
    }
    volume_size = "20"
    volume_type = "gp3"
  }
]
#----------aws ami-data---------#
most_recent_ami = true
owner_ami       = ["099720109477"] # Canonical
ami_filter = [
  {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  },
  {
    name   = "virtualization-type"
    values = ["hvm"]
  }
]





