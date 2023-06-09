## Requirements

| Name | Version   |
|------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4    |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.42    |


## Resources

| Name | Type |
|------|------|
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.public_sub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type                                                                                                              | Default | Required |
|------|-------------|-------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_assign_ipv6_address_on_creation"></a> [assign\_ipv6\_address\_on\_creation](#input\_assign\_ipv6\_address\_on\_creation) | Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false | `bool`                                                                                                            | `false` | no |
| <a name="input_customer_owned_ipv4_pool"></a> [customer\_owned\_ipv4\_pool](#input\_customer\_owned\_ipv4\_pool) | The customer owned IPv4 address pool. Typically used with the map\_customer\_owned\_ip\_on\_launch argument. The outpost\_arn argument must be specified when configured | `string`                                                                                                          | `""` | no |
| <a name="input_enable_dns64"></a> [enable\_dns64](#input\_enable\_dns64) | ndicates whether DNS queries made to the Amazon-provided DNS Resolver in this subnet should return synthetic IPv6 addresses for IPv4-only destinations. Default: false | `bool`                                                                                                            | `false` | no |
| <a name="input_enable_resource_name_dns_a_record_on_launch"></a> [enable\_resource\_name\_dns\_a\_record\_on\_launch](#input\_enable\_resource\_name\_dns\_a\_record\_on\_launch) | Indicates whether to respond to DNS queries for instance hostnames with DNS A records. Default: false | `bool`                                                                                                            | `false` | no |
| <a name="input_enable_resource_name_dns_aaaa_record_on_launch"></a> [enable\_resource\_name\_dns\_aaaa\_record\_on\_launch](#input\_enable\_resource\_name\_dns\_aaaa\_record\_on\_launch) | Indicates whether to respond to DNS queries for instance hostnames with DNS AAAA records. Default: false | `bool`                                                                                                            | `false` | no |
| <a name="input_ipv6_native"></a> [ipv6\_native](#input\_ipv6\_native) | Indicates whether to create an IPv6-only subnet. Default: false | `string`                                                                                                          | `false` | no |
| <a name="input_map_customer_owned_ip_on_launch"></a> [map\_customer\_owned\_ip\_on\_launch](#input\_map\_customer\_owned\_ip\_on\_launch) | Specify true to indicate that network interfaces created in the subnet should be assigned a customer owned IP address. The customer\_owned\_ipv4\_pool and outpost\_arn arguments must be specified when set to true. Default is false | `bool`                                                                                                            | `false` | no |
| <a name="input_map_public_ip_on_launch"></a> [map\_public\_ip\_on\_launch](#input\_map\_public\_ip\_on\_launch) | Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false | `bool`                                                                                                            | `false` | no |
| <a name="input_outpost_arn"></a> [outpost\_arn](#input\_outpost\_arn) | The Amazon Resource Name (ARN) of the Outpost | `string`                                                                                                          | `""` | no |
| <a name="input_private_dns_hostname_type_on_launch"></a> [private\_dns\_hostname\_type\_on\_launch](#input\_private\_dns\_hostname\_type\_on\_launch) | The type of hostnames to assign to instances in the subnet at launch. For IPv6-only subnets, an instance DNS name must be based on the instance ID. For dual-stack and IPv4-only subnets, you can specify whether DNS names use the instance IPv4 address or the instance ID. Valid values: ip-name, resource-name | `string`                                                                                                          | `""` | no |
| <a name="input_public_route_table_id"></a> [public\_route\_table\_id](#input\_public\_route\_table\_id) | Route table nat gateway id (Enter Gateway ID IF enable\_public\_subnet is set to false) | `string`                                                                                                          | `""` | no |
| <a name="input_tags"></a> [tags](#input\tags) | public subnet tags | `map(string)`                                                                                                     | n/a | yes |
| <a name="input_subnet_config"></a> [subnet\_config](#input\_subnet\_config) | CIDR for the public Subnet,availability zone,ipv6 cidr | <pre>map(object({<br>    cidr_block=string<br>    availability_zone=string<br>    ipv6_cidr=string<br>  }))</pre> | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the required vpc | `string`                                                                                                          | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ipv6_cidr_block_association_id"></a> [ipv6\_cidr\_block\_association\_id](#output\_ipv6\_cidr\_block\_association\_id) | The association ID for the IPv6 CIDR block |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | public Subnet IDs. This returns a list of public subnet ids |


## Usage as Module

| Name                                                                                     | Source                                                         | Version |
|------------------------------------------------------------------------------------------|----------------------------------------------------------------|---------|
| <a name="module_subnet_public"></a> [Subnet(Public)](#module\_Subnet__Public) | ../../Modules/Networking and Content Delivery/Subnets (Public) | n/a |

``` 
module "subnets_public"{
    source                                         = "../../../Modules/Networking and Content Delivery/Subnets (Public)"
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
}
```
