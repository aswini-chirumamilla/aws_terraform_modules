<!-- BEGIN_TF_DOCS -->

# INTRODUCTION
This module provides the facility to provision Route 53 delegation id , hosted zone , route 53 records along with query logging and zone association. 

## Prerequisites
Health check id : - [Health check id](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-route53-healthcheck.html)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.56.0|
<a name="provider_aws"></a> [terraform](#provider\_aws) | 1.3.9|

## Modules

```
module "aws_route53_zone"{
  source              = "../../../Modules/Networking & Content Delivery/Route-53"
  reference_name      = var.reference_name
  name                = var.name
  comment             = var.comment
  vpc_id              = var.vpc_id
  vpc_region          = var.vpc_region
  aws_route53_record  = var.aws_route53_record
  policy_name         = var.policy_name
  enable_logging      = var.enable_logging
  retention_in_days   = var.retention_in_days
  association_vpc_ids = var.association_vpc_ids
  tags                = var.tags
}

```

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_resource_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_resource_policy) | resource |
| [aws_route53_delegation_set](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_delegation_set) | resource |
| [aws_route53_query_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_query_log) | resource |
| [aws_route53_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route53_zone_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone_association) | resource |
| [aws_iam_policy_document](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_association_vpc_ids"></a> [association\_vpc\_ids](#input\_association\_vpc\_ids) | A configuration block that defines additional settings available for vpc id and vpc region to be associated in the zone | <pre>map(object({<br>    association_vpc_id     = string<br>    association_vpc_region = string<br>  }))</pre> | `{}` | no |
| <a name="input_aws_route53_record"></a> [aws\_route53\_record](#input\_aws\_route53\_record) | A configuration block that defines settings available for aws_route53_record resource | <pre>map(object({<br>    record_name                             = string<br>    type                             = string<br>    ttl                              = optional(number, 300)<br>    records                          = optional(list(string))<br>    set_identifier                   = string<br>    health_check_id                  = string<br>    multivalue_answer_routing_policy = optional(bool, null)<br>    allow_overwrite                  = optional(bool, false)<br>    weighted_routing_policy = list(object({<br>      weight = string<br>    }))<br>    latency_routing_policy = list(object({<br>      region = string<br>    }))<br>    geolocation_routing_policy = list(object({<br>      continent   = string<br>      subdivision = string<br>      country     = string<br>    }))<br>    cidr_routing_policy = list(object({<br>      collection_id = string<br>      location_name = string<br>    }))<br>    failover_routing_policy = list(object({<br>      type = string<br>    }))<br>    alias = list(object({<br>      alias_name             = string<br>      zone_id_alias          = string<br>      evaluate_target_health = bool<br>    }))<br>  }))</pre> | `{}` | no |
| <a name="input_aws_cloudwatch_log_group_name"></a> [aws_cloudwatch_log_group_name](#input\_aws_cloudwatch_log_group_name) | The name of the cloudwatch log group to store logs. | `string` | `null` | yes |
| <a name="input_comment"></a> [comment](#input\_comment) | The name of the comment. | `string` | n/a | yes |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | If we want to enable logging in the resource then set to true | `bool` | false | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the zone. | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | name of the policy to be attached to the log group | `string` | n/a | yes |
| <a name="input_policy_path"></a> [policy\_path](#input\_policy\_path) | path of the policy document to be attached to the log group | `string` | `null` | yes |
| <a name="input_reference_name"></a> [reference\_name](#input\_reference\_name) | This is a reference name used in Caller Reference (helpful for identifying single delegation set amongst others) | `string` | `null` | no |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Number of Retention days for cloudwatch log group to retain the logs | `number` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the zone. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC to associate. | `string` | n/a | yes |
| <a name="input_vpc_region"></a> [vpc\_region](#input\_vpc\_region) | Region of the VPC to associate. Defaults to AWS provider region. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | ID of hosted zone in route 53 |
<!-- END_TF_DOCS -->