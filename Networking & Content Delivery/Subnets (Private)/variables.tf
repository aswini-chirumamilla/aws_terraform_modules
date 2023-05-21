variable "aws_profile" {
  description = "Name of profile"
  type        = string
}

variable "aws_region" {
  description = "Name of region"
  type        = string
}

variable "vpc_id" {
  description = "ID of the required vpc"
  type        = string
}

variable "private_subnet_config" {
  description = "CIDR for the public Subnet,availability zone,ipv6 cidr"
  type = map(object({
    cidr_block        = string
    availability_zone = string
    ipv6_cidr         = optional(string)
  }))
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

variable "tags" {
  description = "private subnet tags"
  default = {
    Name = "tf-tags"
    env  = "prod"
  }
  type = map(string)
}
