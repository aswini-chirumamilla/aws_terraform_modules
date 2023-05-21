variable "table_name" {
    description = "Name of the DynamoDB Table"
    type = string
}

variable "attributes" {
    description = "Attributes required for partition key and range key. Each attribute should have a name and type. Attribute types must be a scalar type such as (S)tring, (N)umber or (B)inary"
    type =list(map(string))
    default = []
}

variable "partition_key" {
    description = "Partition key for the table. Should also be defined  as key value pair in the atrributes variable as key value pair"
    type = string
}

variable "sort_key" {
    description = "Sort key for the table. Should also be defined in the atrributes variable as key value pair"
    type = string
}

variable "capacity_mode" {
    description = "Manage the Read/Write Throughput. Has an impact on the Billing. Valid values are PROVISIONED AND PAY_PER_REQUES"
    type = string
    default = "PROVISIONED"
}

variable "read_capacity" {
    description = "The number of read units for the table defined. Measured in RCU. If the billing_mode is PROVISIONED, this field should be greater than 0"
    type = number
    default = 5
}

variable "write_capacity" {
    description = "The number of write units for the table defined. Measured in RCU. If the billing_mode is PROVISIONED, this field should be greater than 0"
    type = number
    default = 5
}

variable "point_in_time_recovery_enabled" {
    description = "Flag to enable point-in-time recovery"
    type        = bool
    default     = true
}

variable "global_secondary_indexes" {
    description = "Describe a GSI for the table."
    type        = any
    default     = []
}

variable "local_secondary_indexes" {
    description = "Describe an LSI on the table."
    type        = any
    default     = []
}

variable "ttl_enabled" {
  description = "Indicates whether ttl is enabled"
  type        = bool
  default     = false
}

variable "ttl_attribute_name" {
    description = " The name of the table attribute to store the TTL timestamp in"
    default ="TimeToExist"
    type = string  
}

variable "stream_enabled_dynamodb" {
    description = "Sets the streams to be enabled or disabled"
    default = false
    type=bool  
}

variable "stream_view_type_dynamodb" {
    description = "Sets the information that is written to the stream when table is modified( Options:KEYS_ONLY, NEW_IMAGE, OLD_IMAGE, NEW_AND_OLD_IMAGES)"
    default = "NEW_AND_OLD_IMAGES"
    type = string  
}

variable "server_side_encryption_enabled" {
  description = "Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK)"
  type        = bool
  default     = true
}

variable "server_side_encryption_kms_key_arn" {
  description = "The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb."
  type        = string
  default     = null
}

variable "autoscaling_enabled" {
  description = "Autoscaling flag"
  type        = bool
  default     = false
}

variable "autoscaling_defaults" {
  description = "A map of default autoscaling settings"
  type        = map(string)
  default = {
    scale_in_cooldown  = 0
    scale_out_cooldown = 0
    target_value       = 70
  }
}

variable "autoscaling_read" {
  description = "A map of read autoscaling settings. `max_capacity` is the only required key."
  type        = map(string)
  default     = {}
}

variable "autoscaling_write" {
  description = "A map of write autoscaling settings. `max_capacity` is the only required key."
  type        = map(string)
  default     = {}
}

variable "autoscaling_indexes" {
  description = "A map of index autoscaling configurations."
  type        = map(map(string))
  default     = {}
}

variable "table_class" {
  description = "The storage class of the table. Valid values are STANDARD and STANDARD_INFREQUENT_ACCESS"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to be associated to the DynamoDB table"
  type        = map(string)
  default     = {
    "CreatedBy"   = "Terraform"
    "Environment" = "Testing"
    "name"        = "P03_Sachin"
    "pid"         = "P03"
    "prj-name"    = "AWS GDS CIL Team"
    "owner"       = "sachin.padasali@gds.ey.com"
  }
}

variable "replica_regions" {
    description = "Regions in which replicas needs to be created."
    type        = any
    default     = []
}