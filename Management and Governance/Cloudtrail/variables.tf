variable "aws_region" {
  description = "AWS_Region"
  default     = "ap-northeast-1"
  type        = string


}

variable "aws_profile" {
  description = "AWS_profile"
  default     = "aws_usman1"
  type        = string
}

variable "cloudtrail_name" {

  description = "sets the name for new cloud trail name"
  default     = "tf-trail-new-cloudtrail"
  type        = string
}
variable "cloudtrail_bucket_name" {

  description = "sets the name for the s3 bucket used by cloudtrail "
  default     = "tf-cloudtrail-logging-test-bucket-usman"
  type        = string
}
variable "ct_s3_key_prefix" {
  description = "S3 key prefix that follows the name of the bucket you have designated for log file delivery"
  default     = "prefix"
  type        = string
}
variable "ct_include_global_service_events" {

  description = "Whether the trail is publishing events from global services such as IAM to the log files. Defaults to true"
  default     = false
  type        = bool
}
variable "enable_logging" {
  type        = bool
  default     = true
  description = "Enable logging for the trail"
}
variable "enable_log_file_validation" {
  type        = bool
  default     = true
  description = "Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs"
}
variable "sns_topic_name" {
  type        = string
  description = "Specifies the name of the Amazon SNS topic defined for notification of log file delivery"
  default     = null
}
variable "is_multi_region_trail" {
  type        = bool
  default     = false
  description = "Specifies whether the trail is created in the current region or in all regions"
}
variable "cloud_watch_logs_role_arn" {
  type        = string
  description = "Specifies the role for the CloudWatch Logs endpoint to assume to write to a user’s log group"
  default     = ""
}
variable "cloud_watch_logs_group_arn" {
  type        = string
  description = "Specifies a log group name using an Amazon Resource Name (ARN), that represents the log group to which CloudTrail logs will be delivered"
  default     = ""
}
variable "kms_key_arn" {
  type        = string
  description = "Specifies the KMS key ARN to use to encrypt the logs delivered by CloudTrail"
  default     = ""
}
variable "is_organization_trail" {
  type        = bool
  default     = false
  description = "The trail is an AWS Organizations trail"
}
variable "insight_selector" {
  type = list(object({
    insight_type = string
  }))

  description = "Specifies an insight selector for type of insights to log on a trail"
  default     = []
}
variable "force_destroy" {
  type        = bool
  default     = true
  description = "specifies force to destroy"
}

variable "read_write_type" {
  type = string
  default = "All"
  description = "Type of events to log. Valid values are ReadOnly, WriteOnly, All. Default value is All.value"
}

variable "include_management_events" {
  type = bool
  default = true
  description = "Whether to include management events for your trail. Defaults to truevalue"
}

variable "exclude_management_event_sources" {
  type = list(string)
  default = ["kms.amazonaws.com"]
  description = "A set of event sources to exclude. Valid values include: kms.amazonaws.com and rdsdata.amazonaws.com. include_management_events must be set totrue to allow this"
}

variable "data_resource_type" {
  type   = string
  default = "AWS::S3::Object"
  description = "Resource type in which you want to log data events. You can specify only the following value: 'AWS::S3::Object', 'AWS::Lambda::Function' and 'AWS::DynamoDB::Table'value"
}

variable "data_resource_values" {
  type = list(string)
  default = ["arn:aws:s3"]
  description = "List of ARN strings or partial ARN strings to specify selectors for data audit events over data resources. ARN list is specific to single-valued type. For example, arn:aws:s3:::<bucket name>/ for all objects in a bucket, arn:aws:s3:::<bucket name>/key for specific objects, arn:aws:lambda for all lambda events within an account, arn:aws:lambda:<region>:<account number>:function:<function name> for a specific Lambda function, arn:aws:dynamodb for all DDB events for all tables within an account, or arn:aws:dynamodb:<region>:<account number>:table/<table name> for a specific DynamoDB table.value"
}
 