# VPC Peering
Provides a resource to manage a VPC peering connection.
## Prerequisite
* VPC is required.
* subnets are required.
* Internet Gateway is required.
* Elastic IP is required.
* Route Table need to be attached with VPC,IGW and Peering Connection ID.

## Requirements

| Name | Version   |
|------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4    |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.4 |
| <a name="provider_aws.peer"></a> [aws.peer](#provider\_aws.peer) | ~> 4.4  |


## Resources

| Name | Type |
|------|------|
| [aws_vpc_peering_connection.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |
| [aws_vpc_peering_connection_accepter.peer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection_accepter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_accept"></a> [auto\_accept](#input\_auto\_accept) | Whether additional information about the image being created is collected | `bool` | `true` | no |
| <a name="input_auto_accept_connection"></a> [auto\_accept\_connection](#input\_auto\_accept\_connection) | Whether additional information about the image being created is collected | `bool` | `false` | no |
| <a name="input_main_id"></a> [main\_id](#input\_main\_id) | vpcmain | `string` | n/a | yes |
| <a name="input_peer_id"></a> [peer\_id](#input\_peer\_id) | vpcpeer | `string` | n/a | yes |
| <a name="input_peer_region"></a> [peer\_region](#input\_peer\_region) | peerregion | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for VPC Peering | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_peering_connection_id"></a> [vpc\_peering\_connection\_id](#output\_vpc\_peering\_connection\_id) | vpc peering |


## Usage as Modules

| Name                                                   | Source | Version |
|--------------------------------------------------------|--------|---------|
| <a name="module_VPC-Peering"></a> [VPC-Peering](#module\_VPC-Peering) | ../../../Modules/Networking & Content Delivery/VPC-Peering| n/a |

```
module "peer" {
  source                 = "../../../Modules/Networking & Content Delivery/VPC-Peering"
  main_id                = aws_vpc.main.id
  peer_id                = aws_vpc.peer.id
  peer_region            = var.peer_region
  auto_accept_connection = var.auto_accept_connection
  auto_accept            = var.auto_accept
  tags                   = var.tags
  providers              = { aws.peer = aws.peer }
}

```