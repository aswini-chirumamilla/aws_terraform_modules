variable "aws_profile" {
  description = "Name of profile"
  type        = string
}

variable "aws_region" {
  description = "Name of region"
  type        = string
}

variable "iam_role_arn" {
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group"
  type        = string
  default     = null
}

variable "log_destination" {
  description = "The ARN of the logging destination."
  type        = string
  default     = null
}

variable "traffic_type" {
  description = "The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL."
  type        = string
  validation {
    condition     = contains(["ALL", "ACCEPT", "REJECT"], var.traffic_type)
    error_message = "Argument 'traffic system' must one of 'ALL', or 'ACCEPT', 'REJECT'."
  }
  default = "ALL"
}

variable "log_destination_type" {
  description = " The type of the logging destination. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs"
  type        = string
  validation {
    condition     = contains(["cloud-watch-logs", "s3", "kinesis-data-firehose"], var.log_destination_type)
    error_message = "Argument 'log_destination_type' must one of 'cloud-watch-logs', or 's3', 'kinesis-data-firehose'."
  }
  default = null
}

variable "vpc_id" {
  description = " VPC ID to attach"
  type        = string
  default     = null
}

variable "eni_id" {
  description = "Elastic Network Interface ID to attach"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID to attach"
  type        = string
  default     = null
}

variable "transit_gateway_id" {
  description = "Transit Gateway ID to attach"
  type        = string
  default     = null
}

variable "transit_gateway_attachment_id" {
  description = " Transit Gateway Attachment ID to attach"
  type        = string
  default     = null
}

variable "log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear"
  type        = string
  default     = null
}

variable "max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes). Default: 600. When transit_gateway_id or transit_gateway_attachment_id is specified, max_aggregation_interval must be 60 seconds (1 minute)"
  type        = string
  default     = null
}

variable "destination_options" {
  description = "Describes the destination options for a flow log. More details below."
  type        = string
  default     = null
}

variable "tags" {
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = null
}

variable "file_format" {
  description = "The format for the flow log. Default value: plain-text. Valid values: plain-text, parquet"
  type        = string
  default     = null
}

variable "hive_compatible_partitions" {
  description = "Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3. Default value: false."
  type        = bool
  default     = false
}

variable "per_hour_partition" {
  description = " Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries. Default value: false"
  type        = bool
  default     = false
}