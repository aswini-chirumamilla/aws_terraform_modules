data "aws_vpc" "vpc"{
  id = var.vpc_id
}

data "aws_vpn_gateway" "vgw"{
  id = var.propagation_vgws_id
}

#----------availability zones -------#
data "aws_availability_zones" "az" {
  state = "available"
}
#--------end-availability zones -----#

#----------owner ID -------#
data "aws_caller_identity" "current" {}
#----------owner ID --------#