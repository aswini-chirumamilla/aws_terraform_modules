variable "vpc_id" {
  description = "ID of the required vpc"
  type        = string
}

variable "route" {
  description = "One of the following destination arguments must be supplied: cidr_block(required),ipv6_cidr_block,destination_prefix_list_id. One of the following target arguments must be supplied:carrier_gateway_id, core_network_arn, egress_only_gateway_id, gateway_id, local_gateway_id ,nat_gateway_id,network_interface_id,transit_gateway_id ,vpc_endpoint_id ,vpc_peering_connection_id "
  type = list(map(string))
}

variable "propagation_vgws" {
  description = "A list of virtual gateways for propagation"
  default     = []
  type        = list(string)
}

variable "tags" {
  description = "Common Tags for subnets"
  default = {
    Name = "tf-tags"
    env  = "prod"
  }
  type = map(string)
}









