output "configuration_endpoint" {
  value       = aws_dax_cluster.dax_cluster.configuration_endpoint
  description = "Configuration endpoint for this DAX cluster, consisting of a DNS name and a port number"
}


output "cluster_address" {
  value       = aws_dax_cluster.dax_cluster.cluster_address
  description = "DNS name of the DAX cluster without the port appended"
}

output "cluster_arn" {
  value       = aws_dax_cluster.dax_cluster.arn
  description = "ARN of the DAX cluster"
}