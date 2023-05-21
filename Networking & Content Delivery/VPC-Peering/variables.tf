variable "aws_profile" {
  description = "Name of profile"
  type        = string
}

variable "aws_region" {
  description = "Name of region"
  type        = string
}

variable "peer_profile" {
  description = "peerprofile"
  type        = string
}


variable "tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}

variable "auto_accept_connection" {
  description = "Whether additional information about the image being created is collected"
  type        = bool
  default     = false
}

variable "auto_accept" {
  description = "Whether additional information about the image being created is collected"
  type        = bool
  default     = true
}

variable "peer_region" {
  description = "peerregion"
  type        = string
}

variable "vpc_cidr_main" {
  description = "peerregion"
  type        = string
}


variable "vpc_cidr_peer" {
  description = "peerregion"
  type        = string
}

variable "vpc_main_tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}

variable "vpc_peer_tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}

variable "subnet_public-1_tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}

variable "subnet_public-2_tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}

variable "IGW-1_tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}

variable "IGW-2_tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}

variable "route-1_tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}

variable "route-2_tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}