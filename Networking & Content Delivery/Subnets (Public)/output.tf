output "public_subnet_ids" {
  description = "public Subnet IDs. This returns a list of public subnet ids"
  value       = module.subnets_public.public_subnet_ids
}

output "ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = module.subnets_public.ipv6_cidr_block_association_id
}
