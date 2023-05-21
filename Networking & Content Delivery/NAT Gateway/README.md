# NAT Gateway
Provides the resource to create a VPC NAT Gateway which connects private subnet to the internet through a public NAT gateway.
## Prerequisite
* VPC is required.
* Private subnet and Public subnet is required.
* Internet Gateway is required for connectivity type of Public.
* Elastic IP is required.
* Route Table need to be attached to VPC. 

## Requirements

| Name | Version   |
|------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4    |

## Providers


| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~>4.4   |

## Resources

| Name | Type |
|------|------|
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_id"></a> [allocation\_id](#input\_allocation\_id) | The Allocation ID of the Elastic IP address for the gateway. | `string` | n/a | yes |
| <a name="input_connectivity_type"></a> [connectivity\_type](#input\_connectivity\_type) | Connectivity type for the gateway. | `string` | n/a | yes |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | The private IPv4 address to assign to the NAT gateway. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The Subnet ID of the subnet in which to place the gateway. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for NAT Gateway | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_gateway_id"></a> [nat\_gateway\_id](#output\_nat\_gateway\_id) | NAT Gateway |


## Usage as Modules

| Name                                                   | Source | Version |
|--------------------------------------------------------|--------|---------|
| <a name="module_NAT-Gateway"></a> [NAT-Gateway](#module\_NAT-Gateway) | ../../../Modules/Networking & Content Delivery/NAT Gateway | n/a |

``` 
module "nat" {
  source               = "../../../Modules/Networking & Content Delivery/NAT Gateway"
  allocation_id        = aws_eip.nat_eip.id
  subnet_id            = var.subnet_id
  connectivity_type    = var.connectivity_type
  private_ip           = var.private_ip
   tags = {
    Name = "NAT-Gateway"
  }
}
~~~