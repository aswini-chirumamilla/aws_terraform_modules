aws_profile            = "lalith"
aws_region             = "us-west-1"
peer_profile           = "arul"
peer_region            = "us-west-1"
auto_accept            = true
auto_accept_connection = false
vpc_cidr_main          = "10.1.0.0/16"
vpc_cidr_peer          = "10.0.0.0/16"

tags = {
  Name = "vpc-peering"
}

vpc_main_tags = {
  Name = "vpc-main"
}

vpc_peer_tags = {
  Name = "vpc-peer"
}

subnet_public-1_tags = {
  Name = "peering-subnet-public-1"
}

subnet_public-2_tags = {
  Name = "peering-subnet-public-2"
}

IGW-1_tags = {
  Name = "peering-IGW-1"
}

IGW-2_tags = {
  Name = "peering-IGW-2"
}

route-1_tags = {
  Name = "peering-route-1"
}

route-2_tags = {
  Name = "peering-route-2"
}
