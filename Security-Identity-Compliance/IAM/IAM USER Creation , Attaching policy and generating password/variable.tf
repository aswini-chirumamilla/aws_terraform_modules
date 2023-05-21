variable "region" {
  description = " Name of region "
  type        = string
  default     = "ap-south-1"
}

variable "profile" {
  description = "Name of profile"
  type        = string
  default     = "ArulSaxena"
}

variable "policy_name" {
  type        = string
  description = "Name of the Policy"
}

variable "description" {
  type        = string
  description = "About the policy"
}

variable "path" {
  type        = string
  description = "Path of the policy"
  default     = "/"
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "name_prefix" {
  description = "The resource name prefix and Name tag of the IAM policy"
  type        = string
  default     = null
}

variable "file_name" {
  description = "Name of the files"
  type        = list(string)
}

variable "name" {
  description = "Name for the IAM User"
  type        = string

}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user."
  type        = string
  default     = ""
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = false
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key. `pgp_key` is required when `create_iam_user_login_profile` is set to `true`"
  type        = string
}

variable "enable_login_profile" {
  description = "whether or not to create login_profile."
  type        = bool
  default     = false
}