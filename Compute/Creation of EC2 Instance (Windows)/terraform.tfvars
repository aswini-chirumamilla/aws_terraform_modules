region                               = "us-east-1"
profile                              = "terraform-practice"
#-------instance------#
instanceType                         = ["t2.micro","t2.medium"]
e2_associate_public_ip_address       = false
ec2_sg_ids                           = ["sg-11ab4100"] #["sg-11ab4100"] #Security Group ID will come here.
subnet_id                            = "subnet-4a5aa806" #"subnet-a7dfa996"
private_ip                           = null
ec2_key_name                         = "tf-ec2"
ec2_user_data                        = ""
ec2_data_replace_on_change           = false
availability_zone                    = ""
cpu_core_count                       = null
cpu_threads_per_core                 = null
disable_api_termination              = false
ebs_optimized                        = false
hibernation                          = false
host_id                              = ""
iam_instance_profile                 = "tf-profile"
instance_initiated_shutdown_behavior = "stop"
ipv6_address_count                   = null
monitoring                           = true
tenancy                              = "default"
launch_template                      = null
capacity_reservation_specification   = null
capacity_reservation_target          = {}
credit_specification_cpu_credits     = null
enclave_options_enabled              = false
ephemeral_block_device               = []
get_password_data                    = true
common_tags = {
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
    root_volume_type = "gp2"
    root_volume_size = "30"
    root_volume_tags = {
      FileSystem = "/root"
    }
  }
]
ec2_ebs_device = [
  {
    device_name = "xvdd"
    tags = {
      FileSystem = "/web/data"
    }
    volume_size = "10"
    volume_type = "gp2"
  }
]
#----------aws ami-data---------#
most_recent_ami = true
owner_ami       = ["amazon"] # Canonical
ami_filter = [
  {
    name   = "name"
    values = ["Windows_Server-2022-English-Full-Base*"]
  }
]





