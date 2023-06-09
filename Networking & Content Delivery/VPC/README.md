## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |


## Providers

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |


## Resources

| Name | Type |
|------|------|
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs
`Note:  To make use of arguments that are commented in main.tf. One should see the notes given beside the argument and then comment out the conflicting argument. Also in this section argument description is given which mentions any conflict which the argument can cause.`

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assign_generated_ipv6_cidr_block"></a> [assign\_generated\_ipv6\_cidr\_block](#input\_assign\_generated\_ipv6\_cidr\_block) | Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. Conflicts with ipv6\_ipam\_pool\_id | `bool` | `false` | no |
| <a name="input_aws_vpc_cidr"></a> [aws\_vpc\_cidr](#input\_aws\_vpc\_cidr) | CIDR block for VPC | `string` | n/a | yes |
| <a name="input_enable_classiclink"></a> [enable\_classiclink](#input\_enable\_classiclink) | A boolean flag to enable/disable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic. | `bool` | `false` | no |
| <a name="input_enable_classiclink_dns_support"></a> [enable\_classiclink\_dns\_support](#input\_enable\_classiclink\_dns\_support) | A boolean flag to enable/disable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic | `bool` | `false` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false | `bool` | `false` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false | `bool` | `false` | no |
| <a name="input_enable_network_address_usage_metrics"></a> [enable\_network\_address\_usage\_metrics](#input\_enable\_network\_address\_usage\_metrics) | Indicates whether Network Address Usage metrics are enabled for your VPC. Defaults to false | `bool` | `false` | no |
| <a name="input_instance_tenancy_vpc"></a> [instance\_tenancy\_vpc](#input\_instance\_tenancy\_vpc) | A tenancy option for instances launched into the VPC. Default is default, which ensures that EC2 instances launched in this VPC use the EC2 instance tenancy attribute specified when the EC2 instance is launched. The only other option is dedicated, which ensures that EC2 instances launched in this VPC are run on dedicated tenancy instances regardless of the tenancy attribute specified at launch | `string` | `"default"` | no |
| <a name="input_ipv4_ipam_pool_id"></a> [ipv4\_ipam\_pool\_id](#input\_ipv4\_ipam\_pool\_id) | The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR. IPAM is a VPC feature that you can use to automate your IP address management workflows including assigning, tracking, troubleshooting, and auditing IP addresses across AWS Regions and accounts | `string` | `""` | no |
| <a name="input_ipv4_netmask_length"></a> [ipv4\_netmask\_length](#input\_ipv4\_netmask\_length) | The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4\_ipam\_pool\_id | `number` | `null` | no |
| <a name="input_ipv6_cidr_block"></a> [ipv6\_cidr\_block](#input\_ipv6\_cidr\_block) | IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using ipv6\_netmask\_length | `string` | `""` | no |
| <a name="input_ipv6_cidr_block_network_border_group"></a> [ipv6\_cidr\_block\_network\_border\_group](#input\_ipv6\_cidr\_block\_network\_border\_group) | By default when an IPv6 CIDR is assigned to a VPC a default ipv6\_cidr\_block\_network\_border\_group will be set to the region of the VPC. This can be changed to restrict advertisement of public addresses to specific Network Border Groups such as LocalZones | `string` | `""` | no |
| <a name="input_ipv6_ipam_pool_id"></a> [ipv6\_ipam\_pool\_id](#input\_ipv6\_ipam\_pool\_id) | IPAM Pool ID for a IPv6 pool | `string` | `""` | no |
| <a name="input_ipv6_netmask_length"></a> [ipv6\_netmask\_length](#input\_ipv6\_netmask\_length) | Netmask length to request from IPAM Pool. Conflicts with ipv6\_cidr\_block. | `number` | `null` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | A map of tags to assign to the resource | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_network_acl_id"></a> [default\_network\_acl\_id](#output\_default\_network\_acl\_id) | The ID of the network ACL created by default on VPC creation |
| <a name="output_default_route_table_id"></a> [default\_route\_table\_id](#output\_default\_route\_table\_id) | The ID of the route table created by default on VPC creation |
| <a name="output_default_security_group_id"></a> [default\_security\_group\_id](#output\_default\_security\_group\_id) | The ID of the security group created by default on VPC creation |
| <a name="output_main_route_table_id"></a> [main\_route\_table\_id](#output\_main\_route\_table\_id) | The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws\_main\_route\_table\_association |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | ID of VPC |


## Module Usage

| Name | Source                 | Version |
|------|------------------------|---------|
| <a name="module_vpc_t1"></a> [vpc](#module\_vpc\_t1) | ./Modules/VPC/VPC-TASK | n/a |


``` 
1) Values tested for: 
module "vpc" {
    source = "../Modules/VPC/VPC-TASK"
    aws_vpc_cidr                         = "10.0.0.0/16"
    enable_dns_hostnames                 = false
    enable_dns_support                   = false
    enable_network_address_usage_metrics = false
    instance_tenancy_vpc                 = "default"
    ipv4_ipam_pool_id                    = null
    ipv4_netmask_length                  = null
    ipv6_ipam_pool_id                    = null
    ipv6_netmask_length                  = null
    vpc_tags                             = {
        name = "vpc-tf"
        dev  = "prod"
    }
}

2) Values tested for (with ipv4 ipam pool): 
module "vpc" {
    source = "../Modules/VPC/VPC-TASK"
    instance_tenancy_vpc                 = "default"
    ipv4_ipam_pool_id                    = "ipam-pool-02cb16c774105880b"
    ipv4_netmask_length                  = 28
    enable_dns_hostnames                 = false
    enable_dns_support                   = false
    ipv6_cidr_block_network_border_group = null
    enable_classiclink                   = false
    enable_classiclink_dns_support       = false
    vpc_tags = {
        name = "vpc-tf"
        dev  = "prod"
    }
}

3) Values tested for (with ipv4 ipam pool and dns support and hostname enabled): 
module "vpc" {
    source = "../Modules/VPC/VPC-TASK"
    enable_dns_hostnames                 = true
    enable_dns_support                   = true
    instance_tenancy_vpc                 = "default"
    ipv4_ipam_pool_id                    = "ipam-pool-02cb16c774105880b"
    ipv4_netmask_length                  = 28
    ipv6_cidr_block_network_border_group = null
    enable_classiclink                   = false
    enable_classiclink_dns_support       = false
    assign_generated_ipv6_cidr_block     = false
    vpc_tags = {
        name = "vpc-tf"
        dev  = "prod"
    }
}

4) Values tested for (with ipv4 ipam pool and dns support and hostname enabled and generated ipv6 cidr block): 
module "vpc" {
    source = "../Modules/VPC/VPC-TASK"
    enable_dns_hostnames                 = true
    enable_dns_support                   = true
    instance_tenancy_vpc                 = "default"
    ipv4_ipam_pool_id                    = "ipam-pool-0955201f02e25a3b4"
    ipv4_netmask_length                  = 28
    ipv6_cidr_block_network_border_group = null
    enable_classiclink                   = false
    enable_classiclink_dns_support       = false
    assign_generated_ipv6_cidr_block     = true
    vpc_tags = {
        name = "vpc-tf"
        dev  = "prod"
    }
}

```
