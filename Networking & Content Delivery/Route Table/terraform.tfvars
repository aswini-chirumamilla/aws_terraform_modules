aws_profile         = "awscil_arul"
aws_region          = "us-east-1"
vpc_id              = "vpc-0158fca8d64d2bea8"
propagation_vgws_id = "vgw-0f71849429f6cda1b"
route = [
  {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = "eigw-0fb50f96634010c66"
  }

]
tags = {
  env   = "prod"
  Owner = "Arul Saxena"
}