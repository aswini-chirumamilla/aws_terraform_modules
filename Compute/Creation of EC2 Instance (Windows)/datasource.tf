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
