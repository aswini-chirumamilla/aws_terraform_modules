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

variable "name" {
  description = "Name for the IAM User"
  type        = list(string)
}

variable "usercount" {
  description = "no of users"
  type        = number
}

variable "aws_new_group" {
  description = "Aws new user"
  default     = "Developers"
  type        = string
}

variable "assume_role" {
  description = "List of IAM roles ARNs which can be assumed by the group"
  type        = list(string)
}

variable "group_users" {
  description = "List of IAM users to have in an IAM group which can assumed the role"
  type        = list(string)
  default     = ["user-1"]
}
