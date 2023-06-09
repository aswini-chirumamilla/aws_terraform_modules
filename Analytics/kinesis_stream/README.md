# Kinesis Data Stream 
Creates a resource to manage a kinesis data stream and associate with kinesis stream consumer.
## Prerequisite
* stream mode required.
* kms key id is required.

## Terraform version
| Name | Version |
|------|---------|
| <a name="Terraform"></a> [Terraform](#Terraform) | 1.3.9  |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) |  4.55.0 |


## Resources

| Name | Type |
|------|------|
| [aws_kinesis_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream) | resource |
| [aws_kinesis_stream_consumer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_stream_consumer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_encryption_type"></a> [encryption\_type](#input\_encryption\_type) | The encryption type to use. The only acceptable values are NONE or KMS. The default value is NONE | `string` | `null` | no |
| <a name="input_enforce_consumer_deletion"></a> [enforce\_consumer\_deletion](#input\_enforce\_consumer\_deletion) | A boolean that indicates all registered consumers should be deregistered from the stream so that the stream can be destroyed without error. | `bool` | `false` | no |
| <a name="input_kinesis_stream"></a> [kinesis\_stream](#input\_kinesis\_stream) | A name to identify the stream. This is unique to the AWS account and region the Stream is created in. | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The GUID for the customer-managed KMS key to use for encryption. | `string` | `null` | no |
| <a name="input_retention_period"></a> [retention\_period](#input\_retention\_period) | Length of time data records are accessible after they are added to the stream. The maximum value of a stream's retention period is 8760 hours. Minimum value is 24. Default is 24. | `number` | `null` | no |
| <a name="input_shard_count"></a> [shard\_count](#input\_shard\_count) | The number of shards that the stream will use. If the stream\_mode is PROVISIONED, this field is required. | `number` | `null` | no |
| <a name="input_shard_level_metrics"></a> [shard\_level\_metrics](#input\_shard\_level\_metrics) | A list of shard-level CloudWatch metrics which can be enabled for the stream. | `list(string)` | `null` | no |
| <a name="input_stream_consumer"></a> [stream\_consumer](#input\_stream\_consumer) | Name of the stream consumer. | `string` | n/a | yes |
| <a name="input_stream_mode"></a> [stream\_mode](#input\_stream\_mode) | Specifies the capacity mode of the stream. Must be either PROVISIONED or ON\_DEMAND. | `string` | n/a | yes |
| <a name="input_stream_mode_details"></a> [stream\_mode\_details](#input\_stream\_mode\_details) | Indicates the capacity mode of the data stream. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. If configured with a provider | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kinesis_stream_arn"></a> [kinesis\_stream\_arn](#output\_kinesis\_stream\_arn) | Kinesis stream id |
| <a name="output_stream_consumer_arn"></a> [stream\_consumer\_arn](#output\_stream\_consumer\_arn) | Kinesis stream id |

### Module usage ####

```

  module "kinesis_stream" {
  source                    = "../../AWS-CIL/Modules"
  kinesis_stream            = var.kinesis_stream
  shard_count               = var.shard_count
  retention_period          = var.retention_period
  enforce_consumer_deletion = var.enforce_consumer_deletion
  encryption_type           = var.encryption_type
  kms_key_id                = var.kms_key_id
  shard_level_metrics       = var.shard_level_metrics
  stream_mode_details       = var.stream_mode_details
  stream_mode               = var.stream_mode
  stream_consumer           = var.stream_consumer
  tags                      = var.tags
  }

```
<!-- END_TF_DOCS -->