variable "aws_profile" {
  description = "Name of profile"
  type        = string
}

variable "aws_region" {
  description = "Name of region"
  type        = string
}

# ----------------------------------------------------------------subnet----------------------------------------------------------------------- #
variable "vpc_id" {
  description = "ID of the required vpc"
  type        = string
}

variable "count_private_subnet" {
  description = "Number of private subnet required"
  type        = number
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  type        = list(string)
}

variable "assign_ipv6_address_on_creation" {
  description = "Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
  default     = false
  type        = bool
}

variable "enable_dns64" {
  description = "ndicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false"
  default     = false
  type        = bool
}

variable "enable_resource_name_dns_aaaa_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false"
  default     = false
  type        = bool
}

variable "enable_resource_name_dns_a_record_on_launch" {
  description = "Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false"
  default     = false
  type        = bool
}

variable "subnet_ipv6_cidr_block" {
  description = "The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length"
  default     = ""
  type        = string
}

variable "ipv6_native" {
  description = "Indicates whether to create an IPv6-only subnet. Default: false"
  default     = false
  type        = string
}

variable "map_customer_owned_ip_on_launch" {
  description = " Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer_owned_ipv4_pool and outpost_arn arguments must be specified when set to true. Default is false"
  default     = false
  type        = bool
}

variable "map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false"
  default     = false
  type        = bool
}

variable "outpost_arn" {
  description = "The Amazon Resource Name (ARN) of the Outpost"
  default     = ""
  type        = string
}

variable "private_dns_hostname_type_on_launch" {
  description = "The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name"
  default     = ""
  type        = string
}

variable "customer_owned_ipv4_pool" {
  description = "The customer owned IPv4 address pool. Typically used with the map_customer_owned_ip_on_launch argument. The outpost_arn argument must be specified when configured"
  default     = ""
  type        = string
}

variable "associate_route_table" {
  description = "Set true to enable association route table with subnet"
  default     = false
  type        = bool
}

variable "private_route_table_id" {
  description = "Route table nat gateway id (Enter Gateway ID IF enable_private_subnet is set to false)"
  default     = ""
  type        = string
}

variable "private_subnet_tags" {
  description = "private subnet tags"
  default = {
    Name = "tf-tags"
    env  = "prod"
  }
  type = map(string)
}

#---------------------------------------------------------------------- routetable-------------------------------------------------------------- #

variable "propagation_vgws_id" {
  description = "id of virtual gateways for propagation"
  default     = ""
  type        = string
}

variable "tags" {
  description = "Common Tags for subnets"
  type        = map(string)
}

#--------------------------------------------------------vpc----------------------------------------------------------------------------------------#

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

#------------------------------igw_------------------------

variable "aws_internet_gateway_tags" {
  type        = map(string)
  description = " Key-value map of resource tags for the component."
  default = {
  environment = "dev" }
}
