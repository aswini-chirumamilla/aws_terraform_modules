variable "allocated_storage" {
    type        = number
    description = "Allocated storage in GB. Not required snapshot_identifier or replicate_source_db is provided"
}

variable "allow_major_version_upgrade" {
    type        = bool
    description = "Indicates that major version upgrades are allowed."
    default     = false
}

variable "apply_immediately" {
    type        = bool
    description = "Specifies whether any database modifications are applied immediately, or during the next maintenance window"
    default     = false
}

variable "auto_minor_version_upgrade" {
    type        = bool
    description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
    default     = true
}

variable "availability_zone" {
    type        = list(string)
    description = "The AZ for the RDS instance"
    default     = []
}


variable "backup_retention_period" {
    type        = number
    description = "The days to retain backups for. Must be between 0 and 35"
    default     = 7
}

variable "cross_region_backup_retention_period" {
    type        = number
    description = "The days to retain backups for. Must be between 0 and 35"
    default     = 7
}

variable "backup_window" {
    type        = string
    description = "The daily time range (in UTC) during which automated backups are created if they are enabled. Must not overlap with maintenance_window"
    default     = "00:00-01:00"
}

variable "maintenance_window" {
    type        = string
    description = "The window to perform maintenance in"
    default     = "sun:08:00-sun:12:00"
}

variable "blue_green_update" {
    type        = bool
    description = "Enables low-downtime updates using RDS Blue/Green deployments"
    default     = false
}

variable "ca_cert_identifier" {
    type        = string
    description = "The identifier of the CA certificate for the DB instance"
    default     = null
}

variable "copy_tags_to_snapshot" {
    type        = bool
    description = "Copy all Instance tags to snapshots"
    default     = false
}

variable "custom_iam_instance_profile" {
    type        = string
    description = "The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance" 
    default     = null 
}

variable "db_name" {
    type        = string
    description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance"
    default     = null
}

variable "tags" {
    description = "Tags to be associated to the DynamoDB table"
    type        = map(string)
}

variable "db_subnet_group_name" {
    type        = string
    description = "DB subnet group name"
    default     = null 
}

variable "sg_main" {
    type        = object({ main = optional(object({
                            subnet_group_name   = optional(string, null)
                            subnet_ids          = optional(list(string), null)
                        }))})
    description = "values to be passed for main subnet group creation"
    default = { main = {
          subnet_group_name = null
          subnet_ids = []
          }
        }
}

variable "sg_replica" {
    type        = object({ replica = optional(object({
                        subnet_group_name   = optional(string, null)
                        subnet_ids          = optional(list(string), null)
                    }))})
    description = "values to be passed for replica subnet group creation"
    default = { replica = {
          subnet_group_name = null
          subnet_ids = []
          }
        }
}

variable "delete_automated_backups" {
    type        = bool
    description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
    default     = false
}

variable "deletion_protection" {
    type        = bool
    description = "If the DB instance should have deletion protection enabled"
    default     = true
}

variable "enabled_cloudwatch_logs_exports" {
    type        = list(string)
    description = "Set of log types to enable for exporting to CloudWatch logs"
    default     = [] 
}

variable "engine" {
    type        = string
    description = "The database engine to use. Not required if snapshot_identifier or replicate_source_db is provided"
}

variable "engine_version" {
    type        = string
    description = "The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10)"
}

variable "identifier_main" {
    type        = string
    description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore_to_point_in_time is specified."
    default     = null
}

variable "identifier_replica" {
    type        = list(string)
    description = "The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier"
    default     = []
}

variable "identifier_prefix" {
    type        = string
    description = "Creates a unique identifier beginning with the specified prefix. Conflicts with identifier"
    default     = "Terraform-RDS"
}

variable "instance_class" {
    type        = string
    description = "The instance type of the RDS instance" 
}

variable "iops" {
    type        = string
    description = "The amount of provisioned IOPS. Setting this implies a storage_type of 'io1'"
    default     = "0"
}

variable "kms_key_id" {
    type        = string
    description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN" 
    default     = null
}

variable "cross_region_kms_key_id" {
    type        = string
    description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN" 
    default     = null
}

variable "license_model" {
    type        = string
    description = "License model information for the DB instance"
    default     = null
}

variable "max_allocated_storage" {
    type        = number
    description = "When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated_storage. Must be greater than or equal to allocated_storage or 0 to disable Storage Autoscaling"
    default     = 0
}

variable "monitoring_interval" {
    type        = number
    description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. Valid Values: 0, 1, 5, 10, 15, 30, 60"
    default     = 0
}

variable "monitoring_role_arn" {
    type        = string
    description = "The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs"
    default     = null
}

variable "multi_az" {
    type        = bool
    description = "Specifies if the RDS instance is multi-AZ"
    default     = false
}

### for the aws_db_parameter_group resource
variable "parameter_group_name" {
    type        = string
    description = "Reference to parameter group"
    default     = null
}

# more parameters can be added as maps to the list of db_parameters key
variable "pg_main" {
    type        = object({ main = optional (object({
                                family        = optional(string, null)
                                name          = optional(string, null)
                                db_parameters = optional(list(object(
                                { name = optional(string, null)
                                  value = optional(string, null)}
                                )), [{
                                        name  = null
                                        value = null
                                    }])
                             }),{})}) 
    description = "Values of name and family are passed as objects"
    default     = { main = {
                        family    = null
                        name      = null
                        db_parameters = [{
                            name  = null
                            value = null
                        }]}
                   }
}

variable "pg_replica" {
    type        = object({ replica = optional (object({
                                family        = optional(string, null)
                                name          = optional(string, null)
                                db_parameters = optional(list(object(
                                { name = optional(string, null)
                                  value = optional(string, null)}
                                )), [{
                                        name  = null
                                        value = null
                                    }])
                             }),{})})
    description = "Values of name and family are passed as objects"
    default     = { replica = {
                        family    = null
                        name      = null
                        db_parameters = [{
                            name  = null
                            value = null
                        }]}
                   } 
}

variable "create_before_destroy" {
    type        = bool
    description = "lifecycle flag to check if the parameter group needs to be created before destroying the existing parameter group"
    default     = true
}
###

variable "parameter_name" {
    type        = string
    description = "AWS SSM parameter name which contains the password" 
}

variable "performance_insights_enabled" {
    type        = bool
    description = "Specifies whether Performance Insights are enabled"
    default     = false
}

variable "performance_insights_kms_key_id" {
    type        = string
    description = "The ARN for the KMS key to encrypt Performance Insights data. Required if performance_insights_enabled is set to TRUE"
    default     = null
}

variable "performance_insights_retention_period" {
    type        = number
    description = "Amount of time in days to retain Performance Insights data. Valid values are 7, 731 (2 years) or a multiple of 31. When specifying performance_insights_retention_period, performance_insights_enabled needs to be set to true"
    default     = 7
}

variable "port" {
    type        = number
    description = "The port on which the DB accepts connections"
    default     = null
}

variable "publicly_accessible" {
    type        = bool
    description = "Flag to check if instance is publicly accessible"
    default     = false 
}

variable "replica_mode" {
    type        = string
    description = "Specifies whether the replica is in either mounted or open-read-only mode. SUPPORTED BY ORACLE INSTANCES ONLY"
    default     = "open-read-only"
}

variable "replicate_source_db" {
    type        = string
    description = "Specifies that this resource is a Replicate database, and to use this value as the source database"
    default     = null
}

variable "cross_replication" {
    type        = bool
    description = "Flag to check for enabling the cross region replication "
    default     = false
}

variable "skip_final_snapshot" {
    type        = bool
    description = "Determines whether a final DB snapshot is created before the DB instance is deleted"
    default     = false
}

variable "final_snapshot_identifier" {
    type        = string
    description = "The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip_final_snapshot is set to false"
    default     = null  
}

variable "snapshot_identifier" {
    type        = string
    description = "Specifies whether or not to create this database from a snapshot"
    default     = null
}

variable "storage_encrypted" {
    type        = bool
    description = "Specifies whether the DB instance is encrypted"
    default     = true
}

variable "storage_type" {
    type        = string
    description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (general purpose SSD that needs iops independently) or 'io1' (provisioned IOPS SSD)"
    default     = "io1"
}

variable "username" {
    type        = string
    description = "Username for the master DB user. Cannot be specified for a replica. Not required if snapshot_identifier or replicate_source_db is provided"
    default = null
}

variable "vpc_security_group_ids" {
    type        = list(string)
    description = "List of VPC security groups to associate"
    default     = []
}
