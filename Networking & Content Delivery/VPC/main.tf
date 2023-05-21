############## VPC main #################
resource "aws_vpc" "vpc" {

  cidr_block                            = var.aws_vpc_cidr
  instance_tenancy                      = var.instance_tenancy_vpc
  enable_dns_hostnames                  = var.enable_dns_hostnames
  enable_dns_support                    = var.enable_dns_support
  ipv4_ipam_pool_id                     = var.ipv4_ipam_pool_id
  ipv6_cidr_block_network_border_group  = var.ipv6_cidr_block_network_border_group
  enable_classiclink                    = var.enable_classiclink
  enable_classiclink_dns_support        = var.enable_classiclink_dns_support
  tags                                  = var.vpc_tags
  assign_generated_ipv6_cidr_block      = var.assign_generated_ipv6_cidr_block #Note: Conflicts with ipv6_ipam_pool_id.
  #ipv4_netmask_length                  = var.ipv4_netmask_length #Note: Conflicts with cidr block.
  #ipv6_cidr_block                      = var.ipv6_cidr_block #Note: conflicts with ipv6_netmask_length
  #ipv6_ipam_pool_id                    = var.ipv6_ipam_pool_id #Note: Uncomment if assign_generated_ipv6_cidr_block is set to false
  #ipv6_netmask_length                  = var.ipv6_netmask_length #Note:Netmask length to request from IPAM Pool. Conflicts with ipv6_cidr_block. This can be omitted if IPAM pool as a allocation_default_netmask_length set. Valid values: 56
  #enable_network_address_usage_metrics = var.enable_network_address_usage_metrics #Note:Unsupported argument
  #NOTE: to make use of arguments that are commented above one should see the notes given beside the argument and then comment out the conflicting argument.
}


