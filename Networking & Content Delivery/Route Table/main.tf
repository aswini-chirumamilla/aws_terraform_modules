#---------------------------------------Route Table ------------------------------------------------#
resource "aws_route_table" "rt" {
  vpc_id           = var.vpc_id
  propagating_vgws = var.propagation_vgws
  tags             = var.tags

  dynamic "route" {
    for_each = var.route
    content {
      cidr_block                 = lookup(route.value, "cidr_block", null)
      ipv6_cidr_block            = lookup(route.value, "ipv6_cidr_block", null)
      destination_prefix_list_id = lookup(route.value, "destination_prefix_list_id", null)
      carrier_gateway_id         = lookup(route.value, "carrier_gateway_id", null)
      core_network_arn           = lookup(route.value, "core_network_arn", null)
      egress_only_gateway_id     = lookup(route.value, "egress_only_gateway_id", null)
      gateway_id                 = lookup(route.value, "gateway_id", null)
      local_gateway_id           = lookup(route.value, "local_gateway_id", null)
      nat_gateway_id             = lookup(route.value, "nat_gateway_id", null)
      network_interface_id       = lookup(route.value, "network_interface_id", null)
      transit_gateway_id         = lookup(route.value, "transit_gateway_id", null)
      vpc_endpoint_id            = lookup(route.value, "vpc_endpoint_id", null)
      vpc_peering_connection_id  = lookup(route.value, "vpc_peering_connection_id", null)
    }
  }
}
#------------------------------------end-Route Table ------------------------------------------------#


