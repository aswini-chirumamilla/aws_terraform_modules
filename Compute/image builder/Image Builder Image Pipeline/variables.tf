variable "image_recipe_arn" {
  description = "ARN of image recipe"
  type        = string
  default     = null
}

variable "infrastructure_configuration_arn" {
  description = "ARN of infrastructure configuration in Image Builder"
  type        = string
}

variable "distribution_configuration_arn" {
  description = "ARN of distribution configuration in Image Builder"
  type        = string
  default     = null
}

variable "imagebuilder_image_pipeline_name" {
  description = "Image Pipeline Name"
  type        = string
}

variable "container_recipe_arn" {
  description = "ARN of container recipe "
  type        = string
  default     = null
}

variable "description" {
  description = "Description of Image Pipeline"
  type        = string
}

variable "enhanced_image_metadata_enabled" {
  description = "Whether additional information about the image being created is collected"
  type        = bool
  default     = true
}

variable "pipeline_status" {
  description = "Status of the image pipeline. Valid values are DISABLED and ENABLED. Defaults to ENABLED"
  type        = string
  default     = "ENABLED"
}

variable "image_tests_enabled" {
  description = "Whether image tests are enabled"
  type        = bool
  default     = true
}

variable "timeout_minutes" {
  description = "Number of minutes before image tests time out. Valid values are between 60 and 1440. Defaults to 720"
  type        = number
  default     = 720
}

variable "schedule" {
  description = "Cron expression of how often the pipeline start condition is evaluated"
  type        = string
  default     = "cron(30 10 1 * *)"
}

variable "tags" {
  description = "Tags for imagebuilder image pipeline"
  type        = map(string)
}