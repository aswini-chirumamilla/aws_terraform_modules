## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2 |

## Prerequisite
| Name                                                                                                              | Type |
|-------------------------------------------------------------------------------------------------------------------|------|
| [VPC ID](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                 | resource |

## Resources

| Name | Type |
|------|------|
| [aws_route_table.rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_propagation_vgws"></a> [propagation\_vgws](#input\_propagation\_vgws) | A list of virtual gateways for propagation | `list(string)` | `[]` | no |
| <a name="input_route"></a> [route](#input\_route) | One of the following destination arguments must be supplied: cidr\_block(required),ipv6\_cidr\_block,destination\_prefix\_list\_id. One of the following target arguments must be supplied:carrier\_gateway\_id, core\_network\_arn, egress\_only\_gateway\_id, gateway\_id, local\_gateway\_id ,nat\_gateway\_id,network\_interface\_id,transit\_gateway\_id ,vpc\_endpoint\_id ,vpc\_peering\_connection\_id | `list(map(string))` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common Tags for subnets | `map(string)` | <pre>{<br>  "Name": "tf-tags",<br>  "env": "prod"<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the required vpc | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_route_table_id"></a> [aws\_route\_table\_id](#output\_aws\_route\_table\_id) | The ID of the routing table |


## Usage as Module
Note: For Routing options check - [Example Routing Options](https://docs.aws.amazon.com/vpc/latest/userguide/route-table-options.html)

| Name                                                                                                         | Source         | Version |
|--------------------------------------------------------------------------------------------------------------|----------------|---------|
| <a name="module_route_table"></a> [route_table](#module\_route_table) | ../../../Modules/Networking & Content Delivery/Route Table| n/a |

``` 
module "route_table" {

  source = "../../../Modules/Networking & Content Delivery/Route Table"
  vpc_id           = "vpc-036f1010d8729b67c"
  propagation_vgws = null
  route = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = "igw-054e3e63b4912840d"
    },
    {
      ipv6_cidr_block        = "::/0"
      egress_only_gateway_id = "eigw-0fea8ba29f086b8b6"
    }
  ]
  tags = {
    Name  = "tf-tags"
    env   = "prod"
    Owner = "Arul Saxena"
  }
}
```
