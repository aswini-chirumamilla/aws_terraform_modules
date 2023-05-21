variable "region" {
  description = " Name of region "
  type        = string
  default     = "ap-south-1"
}

variable "profile" {
  description = "Name of profile"
  type        = string
  default     = "Profile-1"
}

variable "users" {
  description = " Names of aws_users "
  type = list(string)
  default = ["user0", "user1", "user2", "user3"]
}

variable "groups" {
  description = " Names of aws_groups "
  type = list(string)
  default = ["group0", "group1",]
}

