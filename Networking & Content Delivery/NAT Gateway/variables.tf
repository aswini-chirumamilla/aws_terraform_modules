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
  description = "The Subnet ID of the subnet in which to place the gateway."
  type        = string
}

variable "allocation_id" {
  description = "The Allocation ID of the Elastic IP address for the gateway."
  type        = string
}