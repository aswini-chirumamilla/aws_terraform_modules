aws_profile = "awscil_arul"
aws_region  = "us-east-1"
vpc_id      = "vpc-0ba4b023ec085297e"
subnet_config = {
  "public-1a" = {
    cidr_block        = "192.0.0.0/17"
    availability_zone = "us-east-1a"
    ipv6_cidr         = null #"2600:1f10:45f1:bd80::/64"
  },
  "public-1b" = {
    cidr_block        = "192.0.128.0/17"
    availability_zone = "us-east-1b"
    ipv6_cidr         = null #"2600:1f10:45f1:bd80::/64"
  }
}
public_route_table_id                          = "rtb-063030d564e0172ac"
assign_ipv6_address_on_creation                = false
customer_owned_ipv4_pool                       = ""
enable_dns64                                   = false
enable_resource_name_dns_a_record_on_launch    = true
enable_resource_name_dns_aaaa_record_on_launch = false
ipv6_native                                    = false
map_customer_owned_ip_on_launch                = false
map_public_ip_on_launch                        = true
outpost_arn                                    = ""
private_dns_hostname_type_on_launch            = "ip-name"
tags = {
  prj-name = "AWS GDS CIL team"
  pid      = "P03"
  Owner    = "Arul.Saxena@gds.ey.com"
}