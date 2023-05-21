output "private_subnet_ids" {
  description = "Private Subnet IDs. This returns a list of private subnet ids"
  value       = module.subnets_private.private_subnet_ids
}

output "ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = module.subnets_private.ipv6_cidr_block_association_id
}



