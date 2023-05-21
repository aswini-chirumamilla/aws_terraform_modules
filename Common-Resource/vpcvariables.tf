

variable "aws_vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "instance_tenancy_vpc" {
  description = "A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch"
  default     = "default"
  type        = string
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false"
  default     = false
  type        = bool
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false"
  default     = false
  type        = bool
}

variable "enable_network_address_usage_metrics" {
  description = "Indicates whether Network Address Usage metrics are enabled for your VPC. Defaults to false"
  default     = false
  type        = bool
}

variable "ipv4_ipam_pool_id" {
  description = "The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts"
  default     = ""
  type        = string
}

variable "ipv4_netmask_length" {
  description = "The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id"
  default     = null
  type        = number
}

variable "ipv6_ipam_pool_id" {
  description = "IPAM Pool ID for a IPv6 pool"
  default     = ""
  type        = string
}

variable "ipv6_netmask_length" {
  description = "Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block."
  default     = null
  type        = number
}

variable "ipv6_cidr_block" {
  description = "IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6_netmask_length"
  default     = ""
  type        = string
}

variable "ipv6_cidr_block_network_border_group" {
  description = "By default when an IPv6 CIDR is assigned to a VPC a default ipv6_cidr_block_network_border_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones"
  default     = ""
  type        = string
}

variable "enable_classiclink" {
  description = "A boolean flag to enable/disable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  default     = false
  type        = bool
}

variable "enable_classiclink_dns_support" {
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic"
  default     = false
  type        = bool
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6_ipam_pool_id"
  default     = false
  type        = bool
}

variable "vpc_tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}
