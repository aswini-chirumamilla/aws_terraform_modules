output "public_subnet_ids" {
  description = "public Subnet IDs. This returns a list of public subnet ids"
  value       = values(aws_subnet.public_subnet)[*].id #try(["${aws_subnet.public_sub.*.id}"], [])
}

output "ipv6_cidr_block_association_id" {
  description = "The association ID for the IPv6 CIDR block"
  value       = try([aws_subnet.public_subnet.*.ipv6_cidr_block_association_id], null)
}