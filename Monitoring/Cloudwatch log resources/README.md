# Cloudwatch log group & streams
 Resource to manage CloudWatch Log Group, streams, metric filter, subscription filter and destination (to Kinesis)

## Prerequisite
* Key Management service, Kinesis data stream, IAM role for Cloudwatch logs


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |


## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_destination.cloudwatch_destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination) | resource |
| [aws_cloudwatch_log_group.cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_metric_filter.cloudwatch_metric_filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_metric_filter) | resource |
| [aws_cloudwatch_log_stream.cloudwatch_log_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_stream) | resource |
| [aws_cloudwatch_log_subscription_filter.cloudwatch_subscription_filter](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_subscription_filter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cw_log_destination_name"></a> [cw\_log\_destination\_name](#input\_cw\_log\_destination\_name) | (Required) A name for the log destination. | `string` | n/a | yes |
| <a name="input_cw_log_role_arn"></a> [cw\_log\_role\_arn](#input\_cw\_log\_role\_arn) | (Required) The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to put data into the target. | `string` | n/a | yes |
| <a name="input_cw_log_role_arn_subs"></a> [cw\_log\_role\_arn\_subs](#input\_cw\_log\_role\_arn\_subs) | (Required) The ARN of the destination to deliver matching log events to. | `string` | n/a | yes |
| <a name="input_cw_log_target_arn"></a> [cw\_log\_target\_arn](#input\_cw\_log\_target\_arn) | (Required) The ARN of the target Amazon Kinesis stream resource for the destination. | `string` | n/a | yes |
| <a name="input_cw_log_target_arn_subs"></a> [cw\_log\_target\_arn\_subs](#input\_cw\_log\_target\_arn\_subs) | The ARN of an IAM role that grants Amazon CloudWatch Logs permissions to deliver ingested log events to the destination. | `string` | n/a | yes |
| <a name="input_distribution"></a> [distribution](#input\_distribution) | (Optional) The method used to distribute log data to the destination. | `string` | `"Random"` | no |
| <a name="input_filter_name"></a> [filter\_name](#input\_filter\_name) | (Required) A name for the metric filter. | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | (Optional) The ARN of the KMS Key to use when encrypting log data. | `string` | `null` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | (Required) The name of the log group. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| <a name="input_log_stream_name"></a> [log\_stream\_name](#input\_log\_stream\_name) | (Required) The name of the log stream. | `string` | n/a | yes |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | (Required) The name of the CloudWatch metric to which the monitored log information should be published | `string` | n/a | yes |
| <a name="input_metric_unit"></a> [metric\_unit](#input\_metric\_unit) | (Optional) The unit to assign to the metric. | `string` | `"none"` | no |
| <a name="input_metric_value"></a> [metric\_value](#input\_metric\_value) | (Required) What to publish to the metric. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (Required) The destination namespace of the CloudWatch metric. | `string` | n/a | yes |
| <a name="input_pattern"></a> [pattern](#input\_pattern) | (Required) A valid CloudWatch Logs filter pattern for extracting metric data out of ingested log events. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | (Optional) Specifies the number of days you want to retain log events in the specified log group. | `number` | `14` | no |
| <a name="input_subs_name"></a> [subs\_name](#input\_subs\_name) | (Required) A name for the subscription filter | `string` | n/a | yes |
| <a name="input_subs_pattern"></a> [subs\_pattern](#input\_subs\_pattern) | (Required) A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudWatch_log_destination_arn"></a> [cloudWatch\_log\_destination\_arn](#output\_cloudWatch\_log\_destination\_arn) | ARN of the cloudwatch log destination |
| <a name="output_cloudwatch_log_group_arn"></a> [cloudwatch\_log\_group\_arn](#output\_cloudwatch\_log\_group\_arn) | ARN of the cloudwatch log group |
| <a name="output_cloudwatch_log_metric_filter_id"></a> [cloudwatch\_log\_metric\_filter\_id](#output\_cloudwatch\_log\_metric\_filter\_id) | ID of the cloudwatch log metric filter |
| <a name="output_cloudwatch_log_stream_arn"></a> [cloudwatch\_log\_stream\_arn](#output\_cloudwatch\_log\_stream\_arn) | ARN of the cloudwatch log stream |
| <a name="output_cloudwatch_subscription_filter_id"></a> [cloudwatch\_subscription\_filter\_id](#output\_cloudwatch\_subscription\_filter\_id) | ID of the cloudwatch log subscription filter |

## Usage as Module

| Name                                                                                     | Source                                                         | Version |
|------------------------------------------------------------------------------------------|----------------------------------------------------------------|---------|
| <a name="module_cloudwatch_log_group_stream"></a> [Cloudwatch log group & stream](#module\_cloudwatch_log_group_stream) | ../../Modules/Compute/Cloudwatch log group & stream| n/a |

```

module "cloudwatch_log_resources" {
  source                  = "../../../Modules/Monitoring/Cloudwatch log resources"
  log_group_name          = var.log_group_name
  retention_in_days       = var.retention_in_days
  kms_key_id              = var.kms_key_id
  log_stream_name         = var.log_stream_name
  cw_log_destination_name = var.cw_log_destination_name
  cw_log_role_arn         = var.cw_log_role_arn
  cw_log_target_arn       = var.cw_log_target_arn
  namespace               = var.namespace
  filter_name             = var.filter_name
  pattern                 = var.pattern
  metric_name             = var.metric_name
  metric_value            = var.metric_value
  metric_unit             = var.metric_unit
  subs_name               = var.subs_name
  cw_log_role_arn_subs    = var.cw_log_role_arn_subs
  subs_pattern            = var.subs_pattern
  cw_log_target_arn_subs  = var.cw_log_target_arn_subs
  distribution            = var.distribution
  tags                    = merge(local.tags, var.tags)
}

locals {
  name_tag_val = join("-", [data.aws_caller_identity.current.account_id, data.aws_availability_zones.az.id])
  tags         = { Name = local.name_tag_val }
}
