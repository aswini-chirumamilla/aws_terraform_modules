module "subnets_private" {
  source = "../../../Modules/Networking & Content Delivery/Subnets(Private)"

  vpc_id                                         = var.vpc_id
  private_subnet_config                          = var.private_subnet_config
  private_route_table_id                         = local.route_table_id
 associate_route_table                           = var.associate_route_table
  tags                                           = merge(local.tags, var.tags)
  assign_ipv6_address_on_creation                = var.assign_ipv6_address_on_creation
  customer_owned_ipv4_pool                       = var.customer_owned_ipv4_pool
  enable_dns64                                   = var.enable_dns64
  enable_resource_name_dns_a_record_on_launch    = var.enable_resource_name_dns_a_record_on_launch
  enable_resource_name_dns_aaaa_record_on_launch = var.enable_resource_name_dns_aaaa_record_on_launch
  ipv6_native                                    = var.ipv6_native
  map_customer_owned_ip_on_launch                = var.map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = var.map_public_ip_on_launch
  outpost_arn                                    = var.outpost_arn
  private_dns_hostname_type_on_launch            = var.private_dns_hostname_type_on_launch
}

locals {
  name_tag_val = join("-", [data.aws_caller_identity.current.account_id, data.aws_availability_zones.az.id])
  tags         = { Name = local.name_tag_val }
  route_table_id= var.private_route_table_id=="" ? null : data.aws_route_table.rt[0].id
}
