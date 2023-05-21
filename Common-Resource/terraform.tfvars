aws_profile = "lalith"
aws_region  = "us-east-2"
# --------------------------------------------------------------------vpc----------------------------------------------------------- #
aws_vpc_cidr                         = "10.0.0.0/18"
aws_region  = "us-east-1"
# --------------------------------------------------------------------vpc----------------------------------------------------------- #
aws_vpc_cidr                         = "10.0.0.0/16"
enable_dns_hostnames                 = true
enable_dns_support                   = true
instance_tenancy_vpc                 = "default"
ipv4_ipam_pool_id                    = null #"ipam-pool-0955201f02e25a3b4"#
ipv4_netmask_length                  = 28
ipv6_ipam_pool_id                    = null
ipv6_netmask_length                  = null
ipv6_cidr_block                      = ""
ipv6_cidr_block_network_border_group = null
enable_classiclink                   = false
enable_classiclink_dns_support       = false
assign_generated_ipv6_cidr_block     = true
vpc_tags = {
  name = "vpc-tf"
  dev  = "prod"
}

#---------------------------------------------------------------subnet--------------------------------------------------------------------------- #

vpc_id                                         = "vpc-0158fca8d64d2bea8"
count_private_subnet                           = 1
private_subnet_cidr                            = ["10.0.0.0/24"]
private_subnet_cidr                            = ["10.0.0.0/25"]
associate_route_table                          = true
private_route_table_id                         = "rtb-01f7e62a435c5e9e4"
assign_ipv6_address_on_creation                = false
customer_owned_ipv4_pool                       = ""
enable_dns64                                   = false
enable_resource_name_dns_a_record_on_launch    = false
enable_resource_name_dns_aaaa_record_on_launch = false
subnet_ipv6_cidr_block                         = null #"2600:1f10:4a54:a405::/64"
ipv6_native                                    = false
map_customer_owned_ip_on_launch                = false
map_public_ip_on_launch                        = true
outpost_arn                                    = ""
private_dns_hostname_type_on_launch            = "ip-name"
private_subnet_tags = {
  "env" : "prod"
}

#---------------------------------------------------------------- routetable---------------------------------------------------- #

propagation_vgws_id = "" #"vgw-0f71849429f6cda1b"#
tags = {
  env   = "prod"
  Owner = "Arul Saxena"
}