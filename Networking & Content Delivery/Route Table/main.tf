module "route_table" {
  source           = "../../../Modules/Networking & Content Delivery/Route Table"
  vpc_id           = data.aws_vpc.vpc.id
  propagation_vgws = [data.aws_vpn_gateway.vgw.id]
  route            = var.route
  tags             = merge(local.tags,var.tags)
}

locals {
  name_tag_val = join("-",[data.aws_caller_identity.current.account_id,data.aws_availability_zones.az.id])
  tags={Name=local.name_tag_val}
}