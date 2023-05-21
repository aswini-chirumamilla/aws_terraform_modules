#NAT Gateway id
output "nat_gateway_id" {
  value       = module.nat.nat_gateway_id
  description = " NAT Gateway "
}