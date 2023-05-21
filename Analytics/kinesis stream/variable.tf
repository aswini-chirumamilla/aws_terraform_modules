##### Provider variables ######

variable "aws_profile" {
  description = "aws profile"
  type        = string
}

variable "aws_region" {
  description = "aws region"
  type        = string
}

#### kinesis stream ######

variable "kinesis_stream" {
  description = "A name to identify the stream. This is unique to the AWS account and region the Stream is created in."
  type        = string
}

variable "shard_count" {
  description = "The number of shards that the stream will use. If the stream_mode is PROVISIONED, this field is required."
  type        = number
  default     = null
}

variable "retention_period" {
  description = "Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24."
  type        = number
  default     = null
}

variable "enforce_consumer_deletion" {
  description = "A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error."
  type        = bool
  default     = false
}

variable "encryption_type" {
  description = "The encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "The GUID for the customer-managed KMS key to use for encryption. "
  type        = string
  default     = null
}

variable "shard_level_metrics" {
  description = "A list of shard-level CloudWatch metrics which can be enabled for the stream."
  type        = list(string)
  default     = null
}

variable "stream_mode_details" {
  description = "Indicates the capacity mode of the data stream."
  type        = string
  default     = null
}

variable "stream_mode" {
  description = "Specifies the capacity mode of the stream. Must be either PROVISIONED or ON_DEMAND."
  type        = string
}

variable "stream_consumer" {
  description = "Name of the stream consumer."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource. If configured with a provider"
  type        = map(string)
}


