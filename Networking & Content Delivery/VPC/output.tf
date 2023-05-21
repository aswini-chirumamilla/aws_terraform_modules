output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "ID of VPC"
}

output "main_route_table_id" {
  value       = module.vpc.main_route_table_id
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws_main_route_table_association"
}

output "default_network_acl_id" {
  value       = module.vpc.default_network_acl_id
  description = "The ID of the network ACL created by default on VPC creation"
}

output "default_security_group_id" {
  value       = module.vpc.default_security_group_id
  description = "The ID of the security group created by default on VPC creation"
}

output "default_route_table_id" {
  value       = module.vpc.default_route_table_id
  description = "The ID of the route table created by default on VPC creation"
}

output"aws_vpc_ipv6" {
  value       = module.vpc.aws_vpc_ipv6
  description = "The association ID for the IPv6 CIDR block"
}
