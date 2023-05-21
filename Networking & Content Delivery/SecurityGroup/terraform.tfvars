aws_region             = "us-east-1"
aws_profile            = "awscil_arul"
security_group_name    = "tf-group"
sg_description         = "tf group"
sg_vpcid               = "vpc-0c3994e9f4988cc99"
revoke_rules_on_delete = false
name_prefix            = ""
sg_tags = {
  Name = "tf-sg"
  env  = "dev"
}
sg_egress = [
  {
    "from_port"      = 0
    "to_port"        = 0
    "protocol"       = "-1"
    "cidr_blocks"    = ["0.0.0.0/0"]
    description      = ""
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }
]
sg_ingress = [
  {
    "from_port"      = 8080
    "to_port"        = 8080
    "protocol"       = "tcp"
    "cidr_blocks"    = ["0.0.0.0/0"]
    description      = ""
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []
    self             = false
  }
]
