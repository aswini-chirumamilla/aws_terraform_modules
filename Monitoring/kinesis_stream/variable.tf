variable "kinesis_stream" {
  type        = string
  description = "A name to identify the stream. This is unique to the AWS account and region the Stream is created in."
}
variable "shard_count" {
  type        = number
  description = "The number of shards that the stream will use. If the stream_mode is PROVISIONED, this field is required."
  default     = null
}
variable "retention_period" {
  type        = number
  description = "Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24."
  default     = null
}
variable "enforce_consumer_deletion" {
  type        = bool
  description = "A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error."
  default     = false
}
variable "encryption_type" {
  type        = string
  description = "The encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE"
  default     = null
}
variable "kms_key_id" {
  type        = string
  description = "The GUID for the customer-managed KMS key to use for encryption. "
  default     = null
}
variable "shard_level_metrics" {
  type        = list(string)
  description = "A list of shard-level CloudWatch metrics which can be enabled for the stream."
  default     = null
}
variable "stream_mode_details" {
  type        = string
  description = "Indicates the capacity mode of the data stream."
  default     = null
}
variable "stream_mode" {
  type        = string
  description = "Specifies the capacity mode of the stream. Must be either PROVISIONED or ON_DEMAND."

}
variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource. If configured with a provider"
  
}
variable "aws_profile" {
  type        = string
  description = "aws profile"

}
variable "aws_region" {
  type        = string
  description = "aws region"

}
variable "stream_consumer" {
  type        = string
  description = "Name of the stream consumer."

}


