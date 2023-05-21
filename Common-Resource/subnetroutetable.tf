locals {
  name_tag_val = join("-", [data.aws_caller_identity.current.account_id, data.aws_availability_zones.az.id])
  tags         = { Name = local.name_tag_val }
}
# -------------------------------------------------------------subnet------------------------------------------------------------------------- #
module "subnets_private" {
  source = "../../Modules/Networking & Content Delivery/Subnets(Private)"

  vpc_id                                         = module.vpc.vpc_id
  count_private_subnet                           = var.count_private_subnet
  private_subnet_cidr                            = var.private_subnet_cidr
  private_route_table_id                         = module.route_table.aws_route_table_id
  private_subnet_tags                            = merge(local.tags, var.private_subnet_tags)
  assign_ipv6_address_on_creation                = var.assign_ipv6_address_on_creation
  associate_route_table                          = var.associate_route_table
  customer_owned_ipv4_pool                       = var.customer_owned_ipv4_pool
  enable_dns64                                   = var.enable_dns64
  enable_resource_name_dns_a_record_on_launch    = var.enable_resource_name_dns_a_record_on_launch
  enable_resource_name_dns_aaaa_record_on_launch = var.enable_resource_name_dns_aaaa_record_on_launch
  ipv6_cidr_block                                = var.subnet_ipv6_cidr_block
  ipv6_native                                    = var.ipv6_native
  map_customer_owned_ip_on_launch                = var.map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = var.map_public_ip_on_launch
  outpost_arn                                    = var.outpost_arn
  private_dns_hostname_type_on_launch            = var.private_dns_hostname_type_on_launch
}


# ------------------------------------------------------------routetable------------------------------------------------------------------ #
module "route_table" {
  source           = "../../Modules/Networking & Content Delivery/Route Table"
  vpc_id           = module.vpc.vpc_id
  propagation_vgws = null #[var.propagation_vgws_id]#
  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.internet_gateway.internet_gateway_id #"eigw-0fb50f96634010c66"#
    }

  ]
  tags = merge(local.tags, var.tags)
}

