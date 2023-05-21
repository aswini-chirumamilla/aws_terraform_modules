###### Extended S3 Destination  ########

variable "extended_s3_stream" {
  description = "A name to identify the stream.It is required parameter, If you give value of extended_s3_stream in terraform.tfvars then we can deploy kinesis firehose delivery in destination extended s3 stream"
  type        = string
  default = null
}

variable "destination_S3" {
  description = "Destination to kinesis firehose.It is required parameter, If you give value of destination_S3 is extended_s3_stream in terraform.tfvars then we can deploy kinesis firehose delivery in destination extended s3 stream"
  type        = string
  default = null
}

variable "extended_s3_configuration" {
  type = list(object({
    role_arn    = string
    bucket_arn  = string
    buffer_size = optional(number, null)
    processing_configuration = list(object({
      enabled = optional(bool, false)
      processors = list(object({
        type = string
        parameters = list(object({
          parameter_name  = string
          parameter_value = string
        }))
      }))
  }))
}))
  description = "Only Required when destination is extended_s3) Enhanced configuration options for the s3 destination."
  default     = []
}

#####    redshift  ######

variable "redshift_name" {
  description = "Name of Redshift destination.It is required parameter, If you give value of redshift_name in terraform.tfvars then we can deploy kinesis firehose delivery in destination Redshift"
  type        = string
  default = null
}

variable "destination_redshift" {
  description = "Destination to kinesis firehose.It is required parameter, If you give value of destination_redshift is Redshift in terraform.tfvars then we can deploy kinesis firehose delivery in destination Redshift"
  type        = string
  default = null
}

variable "s3_configuration" {
  type = list(object({
    role_arn           = string
    bucket_arn         = string
    buffer_size        = optional(number, null)
    buffer_interval    = optional(number, null)
    compression_format = optional(string, null)
  }))
  description = "Only Required when destination is redshift) Enhanced configuration options for the redshift."
  default     = []
}

variable "redshift_configuration" {
  type = list(object({
    role_arn           = string
    cluster_jdbcurl    = string
    username           = string
    password           = string
    data_table_name    = string
    copy_options       = optional(string, null)
    data_table_columns = optional(string, null)
    s3_backup_mode     = optional(string, null)
    s3_backup_configuration = list(object({
      role_arn           = string
      bucket_arn         = string
      buffer_size        = optional(number, null)
      buffer_interval    = optional(number, null)
      compression_format = optional(string, null)
    }))
  }))
  description = "Only Required when destination is redshift) Enhanced configuration options for the redshift."
  default     = []
}

#####    Extended S3 Destination with dynamic partitioning  ######

variable "extended_s3_stream_dynamic" {
  description = "A name to identify the stream.It is required parameter, If you give value of extended_s3_stream_dynamic in terraform.tfvars then we can deploy kinesis firehose delivery in destination extended s3 stream dynamic"
  type        = string
  default = null
}

variable "destination_S3_dynamic" {
  description = "Destination to kinesis firehose.It is required parameter, If you give value of destination_S3 is extended_s3_stream_dynamic in terraform.tfvars then we can deploy kinesis firehose delivery in destination extended s3 stream dynamic"
  type        = string
  default = null
}

variable "extended_s3_configuration_dynamic" {
  type = list(object({
    role_arn    = string
    bucket_arn  = string
    buffer_size = optional(number, null)
    processing_configuration = list(object({
      enabled = optional(string, null)
      processors = list(object({
        type = string
        parameters = list(object({
          parameter_name  = string
          parameter_value = string
          dynamic_partitioning_configuration = list(object({
            enabled        = optional(bool, false)
            retry_duration = optional(number, 300)
          }))
        }))
      }))
    }))
}))
  description = "Only Required when destination is extended_s3_dynamic) Enhanced configuration options for the s3 destination dynamic."
  default     = []
}

### Elasticsearch Destination With VPC ####

variable "elasticsearch_name" {
  description = "A name to identify the stream.It is required parameter, If you give value of elasticsearch_name in terraform.tfvars then we can deploy kinesis firehose delivery in destination elasticsearch"
  type        = string
  default = null
}

variable "destination_elasticsearch" {
  description = "Destination to kinesis firehose.It is required parameter, If you give value of destination_elasticsearch is elasticsearch in terraform.tfvars then we can deploy kinesis firehose delivery in destination elasticsearch"
  type        = string
  default = null
}

variable "elasticsearch_configuration" {
  type = list(object({
    domain_arn = optional(string, null)
    role_arn   = string
    index_name = string
    type_name  = optional(string, null)
    vpc_config = list(object({
      subnet_ids         = list(string)
      security_group_ids = list(string)
      role_arn           = list(string)
    }))
  }))
  description = "Only Required when destination is elasticsearch) Enhanced configuration options for the elasticsearch."
  default     = []
}

#### HTTP Endpoint (e.g., New Relic) Destination ###

variable "HTTP_endpoint_name" {
  description = "A name to identify the stream.It is required parameter, If you give value of HTTP_endpoint_name in terraform.tfvars then we can deploy kinesis firehose delivery in destination HTTP_endpoint"
  type        = string
  default = null
}

variable "destination_HTTP" {
  description = "Destination to kinesis firehose.It is required parameter, If you give value of destination_HTTP is Http_endpoint in terraform.tfvars then we can deploy kinesis firehose delivery in destination_HTTP"
  type        = string
  default = null
}

variable "http_endpoint_configuration" {
  type = list(object({
    url                = string
    name               = optional(string, null)
    access_key         = optional(string, null)
    buffering_size     = optional(string, null)
    buffering_interval = optional(string, null)
    role_arn           = string
    retry_duration     = optional(number, 300)
    s3_backup_mode     = optional(string, null)
    request_configuration = list(object({
      content_encoding = optional(string, null)
      common_attributes = list(object({
        name  = string
        value = optional(string, null)
      }))
    }))
  }))
  description = "Only Required when destination is http_endpoint) Enhanced configuration options for the http_endpoint."
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}