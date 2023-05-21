output "private_subnet_ids" {
  description = "Private Subnet IDs. This returns a list of private subnet ids"
  value       = values(aws_subnet.private_subnet)[*].id
}

output "ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = try([aws_subnet.private_subnet.*.ipv6_cidr_block_association_id], null)
}
