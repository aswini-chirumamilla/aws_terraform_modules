variable "infra_config_name" {
  description = "Name of the infrastructure configuration resource"
  type        = string
}

variable "instance_profile_name" {
  description = "Name of IAM instance profile for launch configuration"
  type        = string
}

variable "infra_config_description" {
  description = "Description of the infrastructure configuration"
  type        = string
}

variable "instance_types" {
  description = "Type of instance being used for Image builder configuration "
  type        = list(string)
  default     = ["t2.nano", "t3.micro"]
}

variable "key_pair" {
  description = "Key Pair values "
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "ID of security groups required for Image Builder Configuration"
  type        = list(string)
  default     = null
}

variable "sns_topic_arn" {
  description = "ARN of SNS"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = "subnet-0a18d7f46636b65c6"
}

variable "terminate_instance_on_failure" {
  description = "Whether instance should be terminated when the pipeline fails (Default value as false)"
  type        = bool
  default     = false
}

variable "enable_logging" {
  description = "Whether logging has to be enabled for the Infrastructure Configuration or  not"
  type        = bool
  default     = false
}

variable "logging" {
  description = "Specifies logging "
  default     = null
  type = object({
    s3_bucket_name = string
    s3_key_prefix  = string
  })
}

variable "tags" {
  description = "tags for imagebuilder infrastructure configuration"
  type        = map(string)
}