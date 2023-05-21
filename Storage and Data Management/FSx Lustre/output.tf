output "file_system_id" {
  description = "Identifier of the file system"
  value       = module.FSx_Lustre.file_system_id
}

output "file_system_subnet_id" {
  description = "Identifier of the subnet for the file system."
  value       = module.FSx_Lustre.file_system_subnet_id
}

output "file_system_security_group_ids" {
  description = "The security groups that apply to the specified network interfaces created for file system access"
  value       = module.FSx_Lustre.file_system_security_group_ids
}

output "file_system_vpc_id" {
  description = "Identifier of the Virtual Private Cloud for the file system."
  value       = module.FSx_Lustre.file_system_vpc_id
}

output "file_system_dns_name" {
  description = "DNS name of the file system"
  value       = module.FSx_Lustre.file_system_dns_name
}

output "file_system_tags" {
  description = "A map of all the tags of the file system"
  value       = module.FSx_Lustre.file_system_tags
}

output "file_system_arn" {
  description = "Amazon Resource Name of the file system"
  value       = module.FSx_Lustre.file_system_arn
}

output "file_system_network_ids" {
  description = "Set of Elastic Network Interface identifiers from which the file system is accessible."
  value       = module.FSx_Lustre.file_system_network_ids
}

output "file_system_owner_id" {
  description = "AWS account identifier that created the file system"
  value       = module.FSx_Lustre.file_system_owner_id
}

output "file_system_mount_name" {
  description = "The value to be used when mounting the filesystem."
  value       = module.FSx_Lustre.file_system_mount_name
}
