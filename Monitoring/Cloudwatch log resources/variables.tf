variable "log_group_name" {
  type        = string
  description = "(Required) The name of the log group. If omitted, Terraform will assign a random, unique name."
}

variable "retention_in_days" {
  type        = number
  description = "(Optional) Specifies the number of days you want to retain log events in the specified log group."
  default     = 14
}

variable "kms_key_id" {
  type        = string
  description = "(Optional) The ARN of the KMS Key to use when encrypting log data."
  default     = null
}

variable "tags" {
  description = "tags"
  type        = map(string)
}

variable "log_stream_name" {
  type        = string
  description = "(Required) The name of the log stream."
}


variable "cw_log_destination_name" {
  description = "(Required) A name for the log destination."
  type        = string

}
variable "cw_log_role_arn" {
  description = "(Required) The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to put data into the target."
  type        = string

}
variable "cw_log_target_arn" {
  description = "(Required) The ARN of the target Amazon Kinesis stream resource for the destination."
  type        = string

}

variable "namespace" {
  description = "(Required) The destination namespace of the CloudWatch metric."
  type        = string
}
variable "filter_name" {
  description = "(Required) A name for the metric filter."
  type        = string
}
variable "pattern" {
  description = "(Required) A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events."
  type        = string
}
variable "metric_name" {
  description = "(Required) The name of the CloudWatch metric to which the monitored log information should be published"
  type        = string
}

variable "metric_value" {
  description = "(Required) What to publish to the metric."
  type        = string
}

variable "metric_unit" {
  description = "(Optional) The unit to assign to the metric."
  type        = string
  default     = "none"

}

variable "subs_name" {
  description = "(Required) A name for the subscription filter"
  type        = string

}

variable "cw_log_role_arn_subs" {
  description = "(Required) The ARN of the destination to deliver matching log events to."
  type        = string
}

variable "subs_pattern" {
  description = "(Required) A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events."
  type        = string
}

variable "cw_log_target_arn_subs" {
  description = "The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination."
  type        = string

}

variable "distribution" {
  description = "(Optional) The method used to distribute log data to the destination."
  type        = string
  default     = "Random"
  validation {
    condition     = var.distribution == "Random" || var.distribution == "ByLogStream"
    error_message = "Valid values are Random and ByLogStream."
  }
}