output "fsx_id" {
  description = "Identifier of the file system"
  value       = aws_fsx_windows_file_system.fsx_test.id
}
output "fsx_arn" {
  description = "File system ARN"
  value       = aws_fsx_windows_file_system.fsx_test.arn
}
output "fsx_dns_name" {
  description = "DNS name of the file system"
  value       = aws_fsx_windows_file_system.fsx_test.dns_name
}
output "fsx_network_ids" {
  description = "Set of Elastic Network Interface identifiers from which the file system is accessible."
  value       = aws_fsx_windows_file_system.fsx_test.network_interface_ids
}
output "fsx_owner_id" {
  description = "AWS account identifier that created the file system"
  value       = aws_fsx_windows_file_system.fsx_test.owner_id
}
output "fsx_tags" {
  description = "A map of all the tags of the file system"
  value       = aws_fsx_windows_file_system.fsx_test.tags_all
}
output "fsx_vpc_id" {
  description = "Identifier of the Virtual Private Cloud for the file system"
  value       = aws_fsx_windows_file_system.fsx_test.vpc_id
}
output "fsx_preferred_server_ip" {
  description = "The IP address of the primary, or preferred, file server."
  value       = aws_fsx_windows_file_system.fsx_test.preferred_file_server_ip
}
output "fsx_remote_endpoint" {
  description = "For MULTI_AZ_1 deployment types, use this endpoint when performing administrative tasks on the file system"
  value       = aws_fsx_windows_file_system.fsx_test.remote_administration_endpoint
}

