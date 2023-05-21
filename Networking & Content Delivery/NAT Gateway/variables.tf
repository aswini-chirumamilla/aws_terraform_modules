variable "aws_profile" {
  description = "Name of profile"
  type        = string
}

variable "aws_region" {
  description = "Name of region"
  type        = string
}

variable "connectivity_type" {
  description = "Connectivity type for the gateway."
  type        = string
}

variable "private_ip" {
  description = "The private IPv4 address to assign to the NAT gateway."
  type        = string
}

variable "tags" {
  description = "tags for NAT Gateway"
  type        = map(string)
}

variable "subnet_id" {
  description = "The subnet address to assign to the NAT gateway."
  type        = string
}

variable "vpc_id" {
  description = "The vpcid to assign to the NAT gateway."
  type        = string
}