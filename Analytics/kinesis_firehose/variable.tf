###### Extended S3 Destination  ########
variable "extended_s3_stream" {
  type        = string
  description = "A name to identify the stream."
}
variable "destination_S3" {
  type        = string
  description = "destination to kinesis firehose"

}
variable "destination_S3_dynamic" {
  type        = string
  description = "destination to kinesis firehose"

}
variable "destination_redshift" {
  type        = string
  description = "destination to kinesis firehose"

}
variable "destination_elasticsearch" {
  type        = string
  description = "destination to kinesis firehose"

}
variable "destination_HTTP" {
  type        = string
  description = "destination to kinesis firehose"

}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource."

}
variable "extended_s3_configuration" {
  type        = string
  description = "only Required when destination is extended_s3) Enhanced configuration options for the s3 destination."
  default     = null
}
variable "role_arn" {
  type        = string
  description = "The ARN of the AWS credentials."
}
variable "bucket_arn" {
  type        = string
  description = "The ARN of the S3 bucket"
}

variable "buffer_interval" {
  description = " buffer_interval"
  type        = string
}

variable "buffer_size" {
  description = "buffer_size "
  type        = string
}
variable "compression_format" {
  description = "compression_format"
  type        = string
}

variable "prefix" {
  description = "prefix"
  type        = string
}

variable "aws_profile" {
  type        = string
  description = "aws profile"

}
variable "aws_region" {
  type        = string
  description = "aws region"

}


variable "extended_s3_stream_dynamic" {
  type        = string
  description = "A name to identify the stream."
}
variable "dynamic_partitioning_configuration_enabled" {
  type        = string
  description = "dynamic_partitioning_configuration."
}
variable "error_output_prefix" {
  description = "error_output_prefix"
  type        = string
}
variable "processing_configuration_enabled" {
  description = "processing_configuration_enabled"
  type        = string
}
variable "parameter_name" {
  description = "parameter_name"
  type        = string
}
variable "parameter_value" {
  description = "parameter_value"
  type        = string
}
variable "type" {
  description = "type"
  type        = string
}
variable "redshift" {
  description = "redshift"
  type        = string
}
variable "cluster_jdbcurl" {
  description = "cluster_jdbcurl"
  type        = string
}
variable "username" {
  description = "username"
  type        = string
}
variable "password" {
  description = "password "
  type        = string
}
variable "data_table_name" {
  description = "data"
  type        = string
}
variable "copy_options" {
  description = "copy_options"
  type        = string
}
variable "data_table_columns" {
  description = ""
  type        = string
}
variable "s3_backup_mode" {
  description = ""
  type        = string
}
variable "elasticsearch" {
  description = "elastic"
  type        = string
}
variable "domain_arn" {
  description = "domain_arn"
  type        = string
}
variable "index_name" {
  description = "index_name"
  type        = string
}
variable "type_name" {
  description = "type_name"
  type        = string
}
variable "subnet_ids" {
  description = "subnet_ids"
  type        = string
}
variable "security_group_id" {
  description = "security_group_id"
  type        = string
}
variable "HTTP_endpoint" {
  description = "HTTP_endpoint"
  type        = string
}
variable "url" {
  description = "url"
  type        = string
}
variable "http_endpoint_configuration" {
  description = "http_endpoint_configuration"
  type        = string
}
variable "access_key" {
  description = "access_key"
  type        = string
}
variable "buffering_size" {
  description = "buffering_size"
  type        = string
}
variable "buffering_interval" {
  description = "buffering_interval"
  type        = string
}
variable "content_encoding" {
  description = "content_encoding"
  type        = string
}
variable "common_attributes" {
  description = "common_attributes"
  type        = string
}
variable "value" {
  description = "value"
  type        = string
}
variable "common_attributes_1" {
  description = "common_attributes_1"
  type        = string
}
variable "value_1" {
  description = "value_1"
  type        = string
}
variable "destination_type" {
  description = "destination_type"
  type        = string
}
