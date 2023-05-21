# aws_flow_log
Provides a VPC Flow Log to capture IP traffic for a specific network interface, subnet, or VPC.

## Requirements
VPC is required.

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
| [aws_flow_log.flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_options"></a> [destination\_options](#input\_destination\_options) | Describes the destination options for a flow log. More details below. | `string` | `null` | no |
| <a name="input_eni_id"></a> [eni\_id](#input\_eni\_id) | Elastic Network Interface ID to attach | `string` | `null` | no |
| <a name="input_file_format"></a> [file\_format](#input\_file\_format) | The format for the flow log. Default value: plain-text. Valid values: plain-text, parquet | `string` | `null` | no |
| <a name="input_hive_compatible_partitions"></a> [hive\_compatible\_partitions](#input\_hive\_compatible\_partitions) | Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3. Default value: false. | `bool` | `false` | no |
| <a name="input_iam_role_arn"></a> [iam\_role\_arn](#input\_iam\_role\_arn) | The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group | `string` | `null` | no |
| <a name="input_log_destination"></a> [log\_destination](#input\_log\_destination) | The type of the logging destination. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs. | `string` | `null` | no |
| <a name="input_log_destination_type"></a> [log\_destination\_type](#input\_log\_destination\_type) | The type of the logging destination. Valid values: cloud-watch-logs, s3, kinesis-data-firehose. Default: cloud-watch-logs | `string` | `null` | no |
| <a name="input_log_format"></a> [log\_format](#input\_log\_format) | The fields to include in the flow log record, in the order in which they should appear | `string` | `null` | no |
| <a name="input_log_group_name"></a> [log\_group\_name](#input\_log\_group\_name) | Deprecated: Use log\_destination instead. The name of the CloudWatch log group. Either log\_group\_name or log\_destination must be set. | `string` | `null` | no |
| <a name="input_max_aggregation_interval"></a> [max\_aggregation\_interval](#input\_max\_aggregation\_interval) | The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes). Default: 600. When transit\_gateway\_id or transit\_gateway\_attachment\_id is specified, max\_aggregation\_interval must be 60 seconds (1 minute) | `string` | `null` | no |
| <a name="input_per_hour_partition"></a> [per\_hour\_partition](#input\_per\_hour\_partition) | Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries. Default value: false | `bool` | `false` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID to attach | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | `null` | no |
| <a name="input_traffic_type"></a> [traffic\_type](#input\_traffic\_type) | The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL. | `string` | n/a | yes |
| <a name="input_transit_gateway_attachment_id"></a> [transit\_gateway\_attachment\_id](#input\_transit\_gateway\_attachment\_id) | Transit Gateway Attachment ID to attach | `string` | `null` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | Transit Gateway ID to attach | `string` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to attach | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_flow_log.flow_log"></a> [aws\_flow\_log.flow\_log](#output\_aws\_flow\_log.flow\_log) | flow log |

## Usage as Modules

| Name                                                   | Source | Version |
|--------------------------------------------------------|--------|---------|
| <a name="module_aws-flow-logs"></a> [aws-flowlogs](#module\_aws-flow-logs) | ../../../Modules/Networking & Content Delivery/NAT Gateway | n/a |


~~~
module "awsflowlogs" {
  source                     = "../../flowlogsv2/module"
  log_destination            = var.log_destination
  traffic_type               = var.traffic_type
  iam_role_arn               = var.iam_role_arn
  vpc_id                     = var.vpc_id
  log_destination_type       = var.log_destination_type
  eni_id                     = var.eni_id
  #log_format                = var.log_format
  max_aggregation_interval   = var.max_aggregation_interval
  destination_options        = var.destination_options
  tags                       = var.tags
  file_format                = var.file_format
  hive_compatible_partitions = var.hive_compatible_partitions
  per_hour_partition         = var.per_hour_partition

}
