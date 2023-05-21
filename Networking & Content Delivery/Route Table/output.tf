output "aws_route_table" {
  value       = module.route_table.aws_route_table_id
  description = "The ID of the routing table"
}

