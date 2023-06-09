variable "create" {
  description = "Controls if App Runner resources should be created"
  type        = bool
  default     = true
}

variable "service_name" {
  description = "App Runner service name"
  type        = string
}

variable "auto_deployments_enabled" {
  description = "Whether continuous integration from the source repository is enabled for the App Runner service. Defaults to true."
  type        = bool
}

variable "service_source_type" {
  description = "The service source type, valid values are 'code' or 'image'"
  type        = string
  validation {
    condition     = contains(["image", "code"], var.service_source_type)
    error_message = "Valid values for var: service_source_type are image, code."
  }
}

variable "vpc_connector_arn" {
  description = "The ARN of the VPC connector to use for the App Runner service"
  type        = string
  default     = ""
}

variable "health_check_configuration" {
  description = "The health check configuration for the App Runner service"
  type        = object({
    healthy_threshold   = number
    unhealthy_threshold = number
    interval            = number
    path                = string
    protocol            = string
    timeout             = number
  })
  default     = null
}

variable "instance_configuration" {
  description = "The instance configuration for the App Runner service"
  type        = object({
    instance_role_arn = string
    cpu               = number
    memory            = number
  })
  default     = null
}

variable "observability_configuration" {
  description = "The observability configuration of your service"
  default     = null
  type        = object({
    observability_configuration_arn = string
    observability_enabled           = bool
  })
}

variable "auto_scaling_configuration_arn" {
  description = "The ARN of auto scaling configuration for the App Runner service"
  type        = string
  default     = ""
}

variable "kms_key_arn" {
  description = "The ARN of the custom KMS key to be used to encrypt the copy of source repository and service logs. By default, App Runner uses an AWS managed CMK"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}

################################################################################
# service_source_type == "image"
################################################################################

variable "image_repository_type" {
  type        = string
  description = "The type of the image repository. This reflects the repository provider and whether the repository is private or public. Defaults to ECR"
  validation {
    condition     = contains(["ECR", "ECR_PUBLIC"], var.image_repository_type)
    error_message = "Valid values for var: image_repository_type are ECR, ECR_PUBLIC."
  }
}

variable "image_identifier" {
  description = "The identifier of an image. For an image in Amazon Elastic Container Registry (Amazon ECR), this is an image name."
  type        = string
  default     = ""
}

variable "image_configuration" {
  description = "Configuration for running the identified image."
  type        = object({
    port                          = optional(number)
    runtime_environment_variables = optional(map(string))
    start_command                 = optional(string)
  })
  default     = null
}

variable "image_access_role_arn" {
  type        = string
  description = "The access role ARN to use for the App Runner service if the service_source_type is 'image' and image_repository_type is not 'ECR_PUBLIC'"
  default     = ""
}

################################################################################
# service_source_type == "code"
################################################################################

variable "code_repository_url" {
  description = "The location of the repository that contains the source code. This is required for service_source_type 'code'"
  type        = string
  default     = ""
}

variable "code_version_type" {
  description = "The type of version identifier. For a git-based repository, branches represent versions. Valid values: BRANCH"
  type        = string
  default     = "BRANCH"
  validation {
    condition     = contains(["BRANCH"], var.code_version_type)
    error_message = "Valid values for var: code_version_type are BRANCH."
  }
}

variable "code_version_value" {
  description = "A source code version. For a git-based repository, a branch name maps to a specific version. App Runner uses the most recent commit to the branch."
  type        = string
  default     = "main"
}

variable "code_configuration_source" {
  description = "The source of the App Runner configuration. Valid values: REPOSITORY, API"
  type        = string
  default     = "REPOSITORY"
  validation {
    condition     = contains(["API", "REPOSITORY"], var.code_configuration_source)
    error_message = "Valid values for var: code_configuration_source are API, REPOSITORY."
  }
}

variable "code_configuration_values" {
  description = "Basic configuration for building and running the App Runner service. Use this parameter to quickly launch an App Runner service without providing an apprunner.yaml file in the source code repository (or ignoring the file if it exists). "
  type        = object({
    runtime                       = optional(string)
    build_command                 = optional(string)
    port                          = optional(number)
    start_command                 = optional(string)
    runtime_environment_variables = optional(map(string))
  })
  default     = null
}

variable "code_connection_arn" {
  type        = string
  description = "The connection ARN to use for the App Runner service if the service_source_type is 'code'"
  default     = ""
}