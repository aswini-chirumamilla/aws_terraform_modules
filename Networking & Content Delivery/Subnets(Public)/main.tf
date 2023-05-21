#----------------------------------------------public Subnet---------------------------------------#
# public Subnet associated with VPC main
resource "aws_subnet" "public_subnet" {
  for_each                                       = var.subnet_config
  vpc_id                                         = var.vpc_id
  cidr_block                                     = each.value.cidr_block
  availability_zone                              = each.value.availability_zone
  assign_ipv6_address_on_creation                = var.assign_ipv6_address_on_creation
  enable_dns64                                   = var.enable_dns64
  enable_resource_name_dns_aaaa_record_on_launch = var.enable_resource_name_dns_aaaa_record_on_launch
  enable_resource_name_dns_a_record_on_launch    = var.enable_resource_name_dns_a_record_on_launch
  ipv6_cidr_block                                = each.value.ipv6_cidr
  ipv6_native                                    = var.ipv6_native
  map_customer_owned_ip_on_launch                = var.map_customer_owned_ip_on_launch
  map_public_ip_on_launch                        = var.map_public_ip_on_launch
  customer_owned_ipv4_pool                       = var.customer_owned_ipv4_pool
  outpost_arn                                    = var.outpost_arn
  private_dns_hostname_type_on_launch            = var.private_dns_hostname_type_on_launch
  tags                                           = var.tags
}

resource "aws_route_table_association" "public" {
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = var.public_route_table_id
}