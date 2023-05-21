variable "recipe_name" {
  description = "Name of image recipe"
  type        = string
}

variable "parent_image" {
  description = "Platform of the image recipe. (EC2 Image AMI ID or Imagebuilder ARN)"
  type        = string
}

variable "recipe_version" {
  description = "Version of the image recipe"
  type        = string
  default     = "1.0.0"
}

variable "recipe_description" {
  description = "Description of the image recipe"
  type        = string
}

variable "user_data_base64" {
  description = "Base64 encoded user data. Use this to provide commands or a command script to run when you launch your build instance"
  type        = string
  default     = null
}

variable "working_directory" {
  description = "The working directory to be used during build and test workflows"
  type        = string
  default     = null
}

variable "uninstall_after_build" {
  description = "Whether to remove the Systems Manager Agent after the image has been built. Defaults to false"
  type        = bool
  default     = false
}

variable "device_name" {
  description = "Name of the device. For example, /dev/sda or /dev/xvdb"
  type        = string
  default     = "/dev/xvdb"
}

variable "no_device" {
  description = "Set to true to remove a mapping from the parent image"
  type        = bool
  default     = true
}

variable "virtual_name" {
  description = "Virtual device name. For example, ephemeral0. Instance store volumes are numbered starting from 0"
  type        = string
  default     = "ephemeral0"
}

variable "delete_on_termination" {
  description = "Whether to delete the volume on termination"
  type        = bool
  default     = true
}

variable "encrypted" {
  description = "Whether to encrypt the volume. Defaults to unset, which is the value inherited from the parent image"
  default     = null
  type        = bool
}

variable "iops" {
  description = "Number of Input/Output (I/O) operations per second to provision for an io1 or io2 volume"
  type        = number
  default     = null
}

variable "kms_key_id" {
  description = "Amazon Resource Name (ARN) of the Key Management Service (KMS) Key for encryption."
  type        = string
  default     = null
}

variable "snapshot_id" {
  description = "Identifier of the EC2 Volume Snapshot"
  type        = string
  default     = null
}

variable "throughput" {
  description = " For GP3 volumes only. The throughput in MiB/s that the volume supports"
  default     = null
}

variable "volume_size" {
  description = "Size of volume in GiB"
  type        = number
  default     = 100
}

variable "volume_type" {
  description = "Type of volume (Example : gp2 or io2)"
  type        = string
  default     = "gp2"
}

variable "component" {
  description = "Ordered configuration block(s) with components for the image recipe. "
  type = list(object({
    component_arn = string
    parameter = optional(list(object({
      para_name  = string
      para_value = string
    })))
  }))
}

variable "tags" {
  description = "tags for imagebuilder recipe"
  type        = map(string)
}
