variable "main_id" {
  description = "vpcmain"
  type        = string
}

variable "peer_id" {
  description = "vpcpeer"
  type        = string
}

variable "peer_region" {
  description = "peerregion"
  type        = string
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

variable "tags" {
  description = "tags for VPC Peering"
  type        = map(string)
}