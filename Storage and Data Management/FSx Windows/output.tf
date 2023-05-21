output "fsx_id" {
  description = "Identifier of the file system"
  value       = module.fsx_windows_file_system.fsx_id
}
output "fsx_arn" {
  description = "File system ARN"
  value       = module.fsx_windows_file_system.fsx_arn
}
output "fsx_dns_name" {
  description = "DNS name of the file system"
  value       = module.fsx_windows_file_system.fsx_dns_name
}
output "fsx_network_ids" {
  description = "Set of Elastic Network Interface identifiers from which the file system is accessible."
  value       = module.fsx_windows_file_system.fsx_network_ids
}
output "fsx_owner_id" {
  description = "AWS account identifier that created the file system"
  value       = module.fsx_windows_file_system.fsx_owner_id
}
output "fsx_tags" {
  description = "A map of all the tags of the file system"
  value       = module.fsx_windows_file_system.fsx_tags
}
output "fsx_vpc_id" {
  description = "Identifier of the Virtual Private Cloud for the file system"
  value       = module.fsx_windows_file_system.fsx_vpc_id
}
output "fsx_preferred_server_ip" {
  description = "The IP address of the primary, or preferred, file server."
  value       = module.fsx_windows_file_system.fsx_preferred_server_ip
}
output "fsx_remote_endpoint" {
  description = "For MULTI_AZ_1 deployment types, use this endpoint when performing administrative tasks on the file system"
  value       = module.fsx_windows_file_system.fsx_remote_endpoint
}

