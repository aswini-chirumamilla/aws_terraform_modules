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
| [aws_security_group.tfsg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique name beginning with the specified prefix. Conflicts with name | `string` | `""` | no |
| <a name="input_revoke_rules_on_delete"></a> [revoke\_rules\_on\_delete](#input\_revoke\_rules\_on\_delete) | Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. This is normally not needed, however certain AWS services such as Elastic Map Reduce may automatically add required rules to security groups used with the service, and those rules may contain a cyclic dependency that prevent the security groups from being destroyed without removing the dependency first. Default false | `bool` | `false` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the security group. If omitted, Terraform will assign a random, unique name | `string` | n/a | yes |
| <a name="input_sg_description"></a> [sg\_description](#input\_sg\_description) | Security group description. Defaults to Managed by Terraform. Cannot be ''(empty string). NOTE: This field maps to the AWS GroupDescription attribute, for which there is no Update API. If you'd like to classify your security groups in a way that can be updated, use tags | `string` | n/a | yes |
| <a name="input_sg_egress"></a> [sg\_egress](#input\_sg\_egress) | Configuration block for egress rules. The following arguments are required: from\_port, to\_port, The following arguments are optional:protocol, cidr\_blocks, description, ipv6\_cidr\_blocks, prefix\_list\_ids, security\_groups, self | <pre>list(object({<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    description      = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>    prefix_list_ids  = list(string)<br>    security_groups  = list(string)<br>    self             = bool<br>  }))</pre> | n/a | yes |
| <a name="input_sg_ingress"></a> [sg\_ingress](#input\_sg\_ingress) | Configuration block for ingress rules. The following arguments are required: from\_port, to\_port, protocol,The following arguments are optional: cidr\_blocks, description, ipv6\_cidr\_blocks, prefix\_list\_ids, security\_groups, self | <pre>list(object({<br>    from_port        = number<br>    to_port          = number<br>    protocol         = string<br>    description      = string<br>    cidr_blocks      = list(string)<br>    ipv6_cidr_blocks = list(string)<br>    prefix_list_ids  = list(string)<br>    security_groups  = list(string)<br>    self             = bool<br>  }))</pre> | n/a | yes |
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | Map of tags to assign to the resource | `map(string)` | n/a | yes |
| <a name="input_sg_vpcid"></a> [sg\_vpcid](#input\_sg\_vpcid) | VPC ID. Defaults to the region's default VPC. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | ID of the security group |


## Usage as Module


| Name                                                                | Source                 | Version |
|---------------------------------------------------------------------|------------------------|---------|
| <a name="module_sg"></a> [Security Group](#module\_security\_group) | ../../../Modules/Networking & Content Delivery/SecurityGroup | n/a |


``` 
module "security_group" {
  source                 = "../../../Modules/Networking & Content Delivery/SecurityGroup"
  security_group_name    = "tf-group"
  sg_description         = "tf group"
  sg_vpcid               = "vpc-0c3994e9f4988cc99"
  revoke_rules_on_delete = false
  sg_tags                = {
  Name = "tf-sg"
  env  = ""prod
  }
  name_prefix            = ""
  sg_egress              = [
    {
      "from_port"      = 0
      "to_port"        = 0
      "protocol"       = "-1"
      "cidr_blocks"    = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  sg_ingress = [
    {
      "from_port"      = 8080
      "to_port"        = 8080
      "protocol"       = "tcp"
      "cidr_blocks"    = ["0.0.0.0/0"]
      description      = ""
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}
```
