variable "aws_region" {
  description = " Name of the region "
  type        = string
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "Name of the profile"
  type        = string
  default     = "terraform"
}

variable "s3_import_path" {
  type        = string
  description = "The s3 bucket to use to back your fsx filesystem."
}

variable "capacity" {
  description = "fsx lustre file system capacity"
  type        = number
}

variable "tags" {
  description = "Tags for FSx Windows"
  type        = map(string)
}

variable "security_group_ids" {
  description = "A list of IDs for the security groups that apply to the specified network interfaces created for file system access"
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "The subnet to create the filesystem in"
  type        = list(string)
}

variable "file_system_type_version" {
  type        = number
  description = "The Lustre version for the file system."
}

variable "storage_type" {
  type        = string
  description = "The filesystem storage type. Either SSD or HDD."
}

variable "backup_id" {
  type        = string
  description = "The ID of the source backup to create the filesystem from."
  default     = null
}

variable "deployment_type" {
  type        = string
  description = "The filesystem deployment type. One of: SCRATCH_1, SCRATCH_2, PERSISTENT_1, PERSISTENT_2."
}

variable "copy_tags_to_backups" {
  description = "Copying tags to backups"
  type        = bool
}

variable "weekly_maintenance_start_time" {
  description = "The weekly maintenance start time."
  type        = string
  default     = null
}

variable "kms_key_id" {
  type        = string
  description = "The kms key id."
  default     = null
}

variable "per_unit_storage_throughput" {
  type        = number
  description = "The per unit strogare throughout for FSx lustre."
}

variable "backup_days" {
  type        = number
  description = "The back retention days."
  default     = 0
}

variable "drive_cache_type" {
  type        = string
  description = "The drive cache type."
  default     = null
}

variable "daily_automatic_backup_start_time" {
  description = "The preferred time (in HH:MM format) to take daily automatic backups, in the UTC time zone."
  type        = string
  default     = null
}

variable "auto_import_policy" {
  type        = string
  description = "The auto import policy for FSx."
}

variable "s3_export_path" {
  type        = string
  description = "The s3 export path for FSx."
}

variable "imported_file_chunk_size" {
  type        = number
  description = "The imported file chunk size for FSx."
}

variable "log_configuration" {
  type        = string
  description = "The Lustre logging configuration used when creating an Amazon FSx for Lustre file system."
  default     = null
}

variable "kms_key_alias_name" {
  description = "Provide Alias name for Customer Managed KMS Key for FSx. Provide the null value for using the default AWS-managed KMS encryption."
  type        = string
  default     = null
}

variable "level" {
  type        = string
  description = "Sets which data repository events are logged by Amazon FSx."
  default     = "DISABLED"
}

variable "data_compression_type" {
  description = "To Set the data compression configuration for the file system valid values are LZ4 and NONE,default is 'NONE' ."
  type        = string
  validation {
    condition     = contains(["LZ4", "NONE"], var.data_compression_type)
    error_message = "Argument 'data_compression_type' must one of 'LZ4', or 'NONE'."
  }
  default = "NONE"
}
