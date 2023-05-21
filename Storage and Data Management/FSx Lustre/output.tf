output "file_system_id" {
  description = "Identifier of the file system"
  value       = aws_fsx_lustre_file_system.fsx_filesystem.id
}

output "file_system_subnet_id" {
  description = "Identifier of the subnet for the file system."
  value       = aws_fsx_lustre_file_system.fsx_filesystem.subnet_ids
}

output "file_system_security_group_ids" {
  description = "The security groups that apply to the specified network interfaces created for file system access"
  value       = aws_fsx_lustre_file_system.fsx_filesystem.security_group_ids
}

output "file_system_vpc_id" {
  description = "Identifier of the Virtual Private Cloud for the file system."
  value       = aws_fsx_lustre_file_system.fsx_filesystem.vpc_id
}

output "file_system_dns_name" {
  description = "DNS name of the file system"
  value       = aws_fsx_lustre_file_system.fsx_filesystem.dns_name
}

output "file_system_tags" {
  description = "A map of all the tags of the file system"
  value       = aws_fsx_lustre_file_system.fsx_filesystem.tags_all
}

output "file_system_arn" {
  description = "Amazon Resource Name of the file system"
  value       = aws_fsx_lustre_file_system.fsx_filesystem.arn
}

output "file_system_network_ids" {
  description = "Set of Elastic Network Interface identifiers from which the file system is accessible."
  value       = aws_fsx_lustre_file_system.fsx_filesystem.network_interface_ids
}

output "file_system_owner_id" {
  description = "AWS account identifier that created the file system"
  value       = aws_fsx_lustre_file_system.fsx_filesystem.owner_id
}

output "file_system_mount_name" {
  description = "The value to be used when mounting the filesystem."
  value       = aws_fsx_lustre_file_system.fsx_filesystem.mount_name
}
