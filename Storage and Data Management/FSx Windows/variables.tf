variable "capacity" {
  description = "Storage capacity for the FSx Windows"
  type        = number
  default     = 200
}
variable "throughput_capacity" {
  description = "Throughput Capacity for the FSx Windows"
  type        = number
  default     = 1024
}
variable "tags" {
  description = "Tags for FSx Windows"
  type        = map(string)
}
variable "directory_id" {
  description = " Active Directory ID"
  type        = string
}
variable "subnet_id" {
  description = "Subnet IDs the file system will be accessible from."
  type        = list(string)
}
variable "aliases" {
  description = "DNS alias names that wants to associate with the Amazon FSx file system"
  type        = list(string)
  default     = null
}
variable "storage_type" {
  description = "The storage type for the Fsx"
  type        = string
  default     = "SSD"
}
variable "deployment_type" {
  description = "Specify the file system deployment type, valid values are MULTI_AZ_1, SINGLE_AZ_1 and SINGLE_AZ_2. Default value is SINGLE_AZ_1."
  type        = string
}
variable "backup_days" {
  description = "The number of days to retain automatic backups. Minimum of 0 and maximum of 90. Defaults to 7. Set to 0 to disable."
  type        = number
  default     = 0
}
variable "copy_tags_to_backups" {
  description = "A boolean flag indicating whether tags on the file system should be copied to backups"
  type        = bool
  default     = false
}
variable "daily_automatic_backup_start_time" {
  description = "The preferred time (in HH:MM format) to take daily automatic backups, in the UTC time zone."
  type        = string
  default     = null
}
variable "weekly_maintenance_start_time" {
  description = "The preferred start time (in d:HH:MM format) to perform weekly maintenance, in the UTC time zone."
  type        = string
  default     = null
}
variable "preferred_subnet_id" {
  description = "Specifiy the subnet in which you want the preferred file server to be located. Required for when deployment type is MULTI_AZ_1."
  type        = string
  default     = null
}
variable "skip_final_backup" {
  description = "When enabled, will skip the default final backup taken when the file system is deleted. "
  type        = bool
  default     = false
}
variable "kms_key_id" {
  description = "KMS Key Id for FSx"
  type        = string
  default     = null
}
variable "security_group_ids" {
  description = "A list of IDs for the security groups that apply to the specified network interfaces created for file system access"
  type        = list(string)
  default     = []
}
variable "backup_id" {
  description = "The ID of the source backup to create the filesystem from."
  type        = string
  default     = null
}
# variable for audit log configuration
variable "audit_log_destination" {
  description = "The Amazon Resource Name (ARN) for the destination of the audit logs. "
  type        = string
  default     = null

}
variable "file_access_audit_log_level" {
  description = "Sets which attempt type is logged by Amazon FSx for file and folder accesses. "
  type        = string
  default     = "DISABLED"
}

variable "file_share_access_audit_log_level" {
  description = "Sets which attempt type is logged by Amazon FSx for file share accesses"
  type        = string
  default     = "DISABLED"


}
#variables for self managed directory
variable "dns_ips" {
  description = "A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory"
  type        = list(string)
}
variable "domain_name" {
  description = "The fully qualified domain name of the self-managed AD directory"
  type        = string
}
variable "secretname" {
  description = "Provide the name of the secret in your AWS Secrets manaer that holds the password for your Self managed directory "
  type        = string
  default     = null
}
variable "username" {
  description = "The user name for the service account on your self-managed AD domain"
  type        = string
}

variable "administrator_group" {
  description = "The name of the domain group whose members are granted administrative privileges for the file system"
  type        = string
  default     = null
}
variable "organizational_unit_name" {
  description = "he fully qualified distinguished name of the organizational unit within your self-managed AD directory that the Windows File Server instance will join."
  type        = string
  default     = null
}