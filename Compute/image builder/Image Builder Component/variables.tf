variable "aws_region" {
  description = "AWS_Region"
  default     = "us-east-1"
  type        = string
}

variable "aws_profile" {
  description = "AWS_profile"
  default     = "RishiHazra"
  type        = string
}

variable "component_name" {
  description = "Name of Image Builder component"
  type        = string
}

variable "platform" {
  description = "OS platform for image component (Either Windows or Linux)"
  type        = string
  default     = "Windows"
}

variable "version_specification" {
  description = "Version of Image Builder Component"
  type        = string
  default     = "1.0.0"
}

variable "component_description" {
  description = "Description of component"
  type        = string
}

variable "change_description" {
  description = "Change description of Component"
  type        = string
  default     = null
}

variable "kms_key_id" {
  description = "Amazon Resource Name (ARN) of the Key Management Service (KMS) Key used to encrypt the component."
  type        = string
  default     = null
}

variable "supported_os_versions" {
  description = "Set of Operating Systems (OS) supported by the component."
  type        = list(string)
  default     = ["Microsoft Windows Server 2019"]
}

variable "component_document" {
  description = "Name of file in which YAML script is written , which has the data of the component. Exactly one of component_document or uri should be specified."
  default     = null
}

variable "uri" {
  description = "S3 URI with data of the component. Exactly one of uri or component_document can be specified."
  type        = string
  default     = null
}

variable "tags" {
  description = " Key-value map of resource tags for the component."
  type        = map(string)
}