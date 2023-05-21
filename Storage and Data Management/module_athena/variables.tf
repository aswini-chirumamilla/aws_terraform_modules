# module athena database

variable "aws_region" {
  description = "The variable mentions the aws region in which the resource will be created"
  type        = string
  default     = "ap-south-1"
}

variable "aws_profile" {
  description = "The variable mentions the aws cli profile which will be used for the resource creation"
  type        = string
}


variable "athena_database" {
  description = "The variable is used to hold the configuration for the athena database."
  type = map(object({
    bucket = string,
    acl_configuration = optional(list(object({
      s3_acl_option = string
    }))),
    comment = optional(string),
    encryption_configuration = optional(list(object({
      encryption_option = string,
      kms_key           = optional(string)
    }))),
    expected_bucket_owner = optional(string),
    force_destroy         = optional(bool),
    properties            = optional(map(string))
  }))
}


# module athena workgroup

variable "athena_workgroup" {
  description = "The variable is used to hold the configuration for the athena workgroup"
  type = map(object({
    name = string,
    configuration = optional(list(object({
      bytes_scanned_cutoff_per_query  = optional(number),
      enforce_workgroup_configuration = optional(bool),
      engine_version = optional(list(object({
        selected_engine_version = optional(string)
      }))),
      execution_role                     = optional(string),
      publish_cloudwatch_metrics_enabled = optional(bool),
      result_configuration = optional(list(object({
        encryption_configuration = optional(list(object({
          encryption_option = string,
          kms_key_arn       = optional(string)
        }))),
        acl_configuration = optional(list(object({
          s3_acl_option = string
        }))),
        expected_bucket_owner = optional(string),
        output_location       = optional(string)
      }))),
      requester_pays_enabled = optional(bool)
    })))
  }))
}

# module athena named query

variable "athena_named_query" {
  description = "The variable is used to hold the configuration for the athena named query"
  type = map(object({
    name        = string,
    workgroup   = optional(string),
    database    = string,
    query       = string,
    description = optional(string)
  }))
}