#----------------------Variables for Provider-----------------------------------------------------------#

variable "aws_region" {
  description = "AWS_Region"
  type        = string
}

variable "aws_profile" {
  description = "AWS_profile"
  type        = string
}

#-----------------------Variables for S3 bucket creation-----------------------------------------------#

variable "s3_bucket_name" {
  description = "The name of S3 bucket"
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length."
  type        = string
  default     = null
}

variable "force_destroy" {
  description = "A boolean that indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. These objects are not recoverable. This only deletes objects when the bucket is destroyed, not when setting this parameter to true"
  type        = bool
  default     = false
}

variable "object_lock_enabled" {
  description = "Whether or not to enable object lock"
  type        = bool
  default     = false
}
#-----------------------Variables for bucket accelerate configuration----------------------------------#

variable "expected_bucket_owner_accelerate_config" {
  description = "(Forces new resource) The account ID of the expected bucket owner."
  type        = string
  default     = null
}

variable "bucket_accelerate_status" {
  description = "The transfer acceleration state of the bucket. Valid values: Enabled, Suspended."
  type        = string
  default = null
}

#-----------Variables for bucket ACL-------------------------------------------------------------------#

variable "expected_bucket_owner_bucket_acl" {
  
  type        = string
  default     = null
 description = "(Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for s3_bucket_acl"
}

variable "s3_bucket_acl" {
  description = "The canned ACL to apply to the bucket. Valid Calues : 'private', 'public-read' , 'public-read-write', 'aws-exec-read', 'authenticated-read', 'bucket-owner-read', 'bucket-owner-full-control' or 'log-delivery-write'. "
  type        = string
  default     = null
}

#-------------------------Variables for bucket CORS Configuration--------------------------------------#

variable "enable_s3_bucket_cors_configuration" {
  description = "Whether or not to enable CORS configuration"
  type        = bool
  default     = false
}

variable "expected_bucket_owner_cors_config" {
  description = "(Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for cors_rule"
  type        = string
  default     = null
}

variable "cors_rule" {
  description = "Configuration block for CORS RULE"
  type = list(object({
    allowed_methods = list(string)           # Valid values are GET, PUT, HEAD, POST, and DELETE
    allowed_origins = list(string)           # (Required) Set of origins you want customers to be able to access the bucket from.
    allowed_headers = optional(list(string)) # (Optional) Set of Headers that are specified in the Access-Control-Request-Headers header.
    expose_headers  = optional(list(string)) # (Optional) Set of headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object).
    cors_rule_id    = optional(string , null)       # (Optional) Unique identifier for the rule. The value cannot be longer than 255 characters.
    max_age_seconds = optional(number , null)       #  (Optional) The time in seconds that your browser is to cache the preflight response for the specified resource.
  }))
  default = []
}

#---------Variables for bucket lifecycle configuration-------------------------------------------------#

variable "enable_s3_bucket_lifecycle_configuration" {
  description = "Whether or not to enable CORS configuration"
  type        = bool
  default     = false
}

variable "s3_lifecycle_configuration_rule" {
  description = "An S3 Lifecycle configuration is a block consists of one or more Lifecycle rules. Each rule consists of the following: 1.Rule metadata (id and status).  2.Filter identifying objects to which the rule applies. 3.One or more transition or expiration actions"
  type = list(object({
    id = string
    expiration = optional(list(object({
      days = number # (Optional) The lifetime, in days, of the objects that are subject to the rule. The value must be a non-zero positive integer.
    })))
    status = string # (Required) Whether the rule is currently being applied. Valid values: Enabled or Disabled.
    filter = optional(list(object({
      object_size_greater_than = optional(number , null) # (Optional) Minimum object size (in bytes) to which the rule applies.
      object_size_less_than    = optional(number , null) # (Optional) Maximum object size (in bytes) to which the rule applies.
      prefix                   = optional(string , null) # (Optional) Prefix identifying one or more objects to which the rule applies. Defaults to an empty string ("") if not specified.
    })))
  }))
  default = []
}

#-----------------Variables for S3 Bucket Logging------------------------------------------------------#

variable "expected_bucket_owner_bucket_logging" {
  description = "(Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for target_bucket and target_prefix"
  type        = string
  default     = null
}

variable "target_bucket" {
  description = "The name of the bucket where you want Amazon S3 to store server access logs."
  type        = string
  default     = null
}

variable "target_prefix" {
  description = "A prefix for all log object keys."
  type        = string
  default     = null
}
#--------s3_policy related variable -------------------------------------------------------------------#

variable "s3policy_filepath" {
  description = "S3 policy file"
  type        = string
  default     = null
}

#------------------Variables for Bucket Replication Configuration--------------------------------------#

variable "enable_s3_bucket_replication_configuration" {
  description = "Whether or not to enable s3 bucket replication configuration"
  type        = bool
  default     = false
}

variable "role" {
  description = "The ARN of the IAM role for Amazon S3 to assume when replicating the objects"
  type        = string
  default     = null
}

variable "replication_configuration_token" {
  description = "A token to allow replication to be enabled on an Object Lock-enabled bucket. You must contact AWS support for the bucket's Object Lock token. Input for this parameter should not be entered until proper input values are provided for role and replication_configuration_rule"
  type        = string
  default     = null
}

variable "replication_configuration_rule" {
  description = "(Required) List of configuration blocks describing the rules managing the replication"
  type = list(object({
    destination = list(object({
      destination_bucket = string           # (Required) The Amazon Resource Name (ARN) of the bucket where you want Amazon S3 to store the results.
      account            = optional(string , null) # (Optional) The Account ID to specify the replica ownership. Must be used in conjunction with access_control_translation override configuration.
      storage_class      = optional(string , null) # (Optional) The storage class used to store the object. By default, Amazon S3 uses the storage class of the source object to create the object replica.
      access_control_translation = optional(list(object({
        owner = string # (Required) Specifies the replica ownership. For default and valid values, see PUT bucket replication in the Amazon S3 API Reference. Valid values: Destination.
      })))
      encryption_configuration = optional(list(object({
        replica_kms_key_id = string # (Required) The ID (Key ARN or Alias ARN) of the customer managed AWS KMS key stored in AWS Key Management Service (KMS) for the destination bucket
      })))
      metrics = optional(list(object({
        metrics_status = string # (Required) The status of the Destination Metrics. Either "Enabled" or "Disabled".
        event_threshold = optional(list(object({
          event_threshold_minutes = number # (Required) Time in minutes. Valid values: 15.
        })))
      })))
      replication_time = optional(list(object({
        replication_time_status = string # (Required) The status of the Replication Time Control. Either "Enabled" or "Disabled".
        time = list(object({             # (Required) A configuration block specifying the time by which replication should be complete for all objects and operations on objects
          replication_minutes = number   # (Required) Time in minutes. Valid values: 15
        }))
      })))
    }))
    replication_configuration_rule_status = string # (Required) The status of the rule. Either "Enabled" or "Disabled". The rule is ignored if status is not "Enabled".
    delete_marker_replication = optional(list(object({
      delete_marker_replication_status = string # (Required) Whether delete markers should be replicated. Either "Enabled" or "Disabled"
    })))
    existing_object_replication = optional(list(object({
      existing_object_replication_status = string # (Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".
    })))
    id       = optional(string , null) # (Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length
    priority = optional(number , null) # (Optional) The priority associated with the rule. Priority should only be set if filter is configured. If not provided, defaults to 0. Priority must be unique between multiple rules.
    source_selection_criteria = optional(list(object({
      replica_modifications = optional(list(object({
        replica_modifications_status = string # (Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".
      })))
      sse_kms_encrypted_objects = optional(list(object({
        sse_kms_encrypted_objects_status = string # (Required) Whether the existing objects should be replicated. Either "Enabled" or "Disabled".
      })))
    })))
    filter = optional(list(object({
      and = optional(list(object({                #  Configuration block for specifying rule filters. This element is required only if you specify more than one filter.
        and_prefix = optional(string , null)      # (Optional) An object key name prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length.
        and_tags   = optional(map(string)) # (Optional, Required if prefix is configured) A map of tags (key and value pairs) that identifies a subset of objects to which the rule applies. The rule applies only to objects having all the tags in its tagset.
      })))
      prefix = string # (Optional) An object key name prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length.
      tag = optional(list(object({
        tag_key   = string # (Required) Name of the object key.
        tag_value = string # (Required) Value of the tag.
      })))
    })))
  }))
  default = []
}

#---------------Variables for Request Payment Configuration Resource-----------------------------------#

variable "expected_bucket_owner_payment_config" {
  description = "(Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for payer"
  type        = string
  default     = null
}

variable "payer" {
  description = "Specifies who pays for the download and request fees. Valid values: BucketOwner, Requester"
  type        = string
  default = null
}

#--------------Variables for Server side encryption Configuration--------------------------------------#

variable "enable_s3_bucket_server_side_encryption_configuration" {
  description = "Whether or not to enable s3 bucket server side encryption configuration"
  type        = bool
  default     = false
}

variable "expected_bucket_owner_server_side_encryption_config" {
  description = "(Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for  server_side_encryption_configuration_rule"
  type        = string
  default     = null
}

variable "server_side_encryption_configuration_rule" {
  description = "Rule block for server side encryption configuration"
  type = list(object({
    bucket_key_enabled = optional(bool, false)
    apply_server_side_encryption_by_default = optional(list(object({
      sse_algorithm     = string
      kms_master_key_id = optional(string , null)
    })))
  }))
  default = []
}

#-------------Variables for Bucket versioning----------------------------------------------------------#

variable "enable_s3_bucket_versioning" {
  description = "Whether or not to enable s3 bucket versioning"
  type        = bool
  default     = false
}

variable "expected_bucket_owner_bucket_versioning" {
  description = "(Forces new resource) The account ID of the expected bucket owner. Value for this parameter should be entered only if proper input value is provided for versioning_configuration"
  type        = string
  default     = null
}

variable "bucket_versioning_mfa" {
  description = "(Optional, Required if versioning_configuration mfa_delete is enabled) The concatenation of the authentication device's serial number, a space, and the value that is displayed on your authentication device. Value for this parameter should be entered only if proper input value is provided for versioning_configuration"
  type        = string
  default     = null
}

variable "versioning_configuration" {
  description = "Configuration block for versioning of s3 bucket"
  type = list(object({
    versioning_status = string
    mfa_delete        = optional(string , null)
  }))
  default = []
}

#---------------------Variable for Common Tags---------------------------------------------------------#

variable "tags" {
  description = "common tags for all resources"
  type        = map(string)
}









