## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.37 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.40.0 |

## Prerequiste

| Name | Type |
|------|------|
| <a name="vpc"></a> [vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Resources

| Name | Type |
|------|------|
| [aws_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_internet_gateway_tags"></a> [aws\_internet\_gateway\_tags](#input\_aws\_internet\_gateway\_tags) | Key-value map of resource tags for the component. | `map(string)` | <pre>{<br>  "environment": "dev",<br>  "name": "internet_gateway"<br>}</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Input the id for VPC | `string` | `"10.0.0.0/26"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_internet_gateway_id"></a> [internet\_gateway\_id](#output\_intenet\_gateway\_id) | internet gateway id |

## Usage as Modules
| Name                                                           | Source                | Version |
|----------------------------------------------------------------|-----------------------|---------|
| <a name="module_sg_ec2"></a> [Internet\_Gateway](#module\_ec2\_win) | ../../../Modules/Networking and Content Delivery/IGW- Creation of Internet Gateway | n/a |

```
module "internet_gateway" {
  source = "../../../Modules/Networking and Content Delivery/internet_gateway"
 vpc_id            = "vpc-0e2e00348bd7ec736"
 tags                = {name="tf-igw"}

}

