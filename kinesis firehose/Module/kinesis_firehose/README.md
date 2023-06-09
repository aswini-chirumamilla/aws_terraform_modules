## Description
Creates a Kinesis Firehose delivery stream service with all destinations (S3 stream, S3 stream dynamic,Redshift, elastic search with VPC, HTTP endpoint)

## Prerequisite
* Provide values for destination name and destination type
* Provide domain arn for elastic search destination.
* Provide subnet ids and security group ids for elastic search destination
* Provide role arn for all destinations in kinesis firehose.
* Provide bucket arn
* Provide cluster_jdbcurl for Redshift destination.

## Requirements


| Name | Version |
|------|---------|
| <a name="Terraform"></a> [Terraform](#Terraform) | v1.3.9 |


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) |  ">= 4.55.0" |


## Resources

| Name | Type |
|------|------|
| [aws_kinesis_firehose_delivery_stream.HTTP_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.elasticsearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.extended_s3_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.extended_s3_stream_dynamic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |
| [aws_kinesis_firehose_delivery_stream.redshift](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_firehose_delivery_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_HTTP_endpoint_name"></a> [HTTP\_endpoint\_name](#input\_HTTP\_endpoint\_name) | A name to identify the stream.It is required parameter, If you give value of HTTP\_endpoint\_name in terraform.tfvars then we can deploy kinesis firehose delivery in destination HTTP\_endpoint | `string` | `null` | no |
| <a name="input_destination_HTTP"></a> [destination\_HTTP](#input\_destination\_HTTP) | Destination to kinesis firehose.It is required parameter, If you give value of destination\_HTTP is Http\_endpoint in terraform.tfvars then we can deploy kinesis firehose delivery in destination\_HTTP | `string` | `null` | no |
| <a name="input_destination_S3"></a> [destination\_S3](#input\_destination\_S3) | Destination to kinesis firehose.It is required parameter, If you give value of destination\_S3 is extended\_s3\_stream in terraform.tfvars then we can deploy kinesis firehose delivery in destination extended s3 stream | `string` | `null` | no |
| <a name="input_destination_S3_dynamic"></a> [destination\_S3\_dynamic](#input\_destination\_S3\_dynamic) | Destination to kinesis firehose.It is required parameter, If you give value of destination\_S3 is extended\_s3\_stream\_dynamic in terraform.tfvars then we can deploy kinesis firehose delivery in destination extended s3 stream dynamic | `string` | `null` | no |
| <a name="input_destination_elasticsearch"></a> [destination\_elasticsearch](#input\_destination\_elasticsearch) | Destination to kinesis firehose.It is required parameter, If you give value of destination\_elasticsearch is elasticsearch in terraform.tfvars then we can deploy kinesis firehose delivery in destination elasticsearch | `string` | `null` | no |
| <a name="input_destination_redshift"></a> [destination\_redshift](#input\_destination\_redshift) | Destination to kinesis firehose.It is required parameter, If you give value of destination\_redshift is Redshift in terraform.tfvars then we can deploy kinesis firehose delivery in destination Redshift | `string` | `null` | no |
| <a name="input_elasticsearch_configuration"></a> [elasticsearch\_configuration](#input\_elasticsearch\_configuration) | Only Required when destination is elasticsearch) Enhanced configuration options for the elasticsearch. | <pre>list(object({<br>    domain_arn = optional(string, null)<br>    role_arn   = string<br>    index_name = string<br>    type_name  = optional(string, null)<br>    vpc_config = list(object({<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      role_arn           = list(string)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_elasticsearch_name"></a> [elasticsearch\_name](#input\_elasticsearch\_name) | A name to identify the stream.It is required parameter, If you give value of elasticsearch\_name in terraform.tfvars then we can deploy kinesis firehose delivery in destination elasticsearch | `string` | `null` | no |
| <a name="input_extended_s3_configuration"></a> [extended\_s3\_configuration](#input\_extended\_s3\_configuration) | Only Required when destination is extended\_s3) Enhanced configuration options for the s3 destination. | <pre>list(object({<br>    role_arn    = string<br>    bucket_arn  = string<br>    buffer_size = optional(number, null)<br>    processing_configuration = list(object({<br>      enabled = optional(bool, false)<br>      processors = list(object({<br>        type = string<br>        parameters = list(object({<br>          parameter_name  = string<br>          parameter_value = string<br>        }))<br>      }))<br>  }))<br>}))</pre> | `[]` | no |
| <a name="input_extended_s3_configuration_dynamic"></a> [extended\_s3\_configuration\_dynamic](#input\_extended\_s3\_configuration\_dynamic) | Only Required when destination is extended\_s3\_dynamic) Enhanced configuration options for the s3 destination dynamic. | <pre>list(object({<br>    role_arn    = string<br>    bucket_arn  = string<br>    buffer_size = optional(number, null)<br>    processing_configuration = list(object({<br>      enabled = optional(string, null)<br>      processors = list(object({<br>        type = string<br>        parameters = list(object({<br>          parameter_name  = string<br>          parameter_value = string<br>          dynamic_partitioning_configuration = list(object({<br>            enabled        = optional(bool, false)<br>            retry_duration = optional(number, 300)<br>          }))<br>        }))<br>      }))<br>    }))<br>}))</pre> | `[]` | no |
| <a name="input_extended_s3_stream"></a> [extended\_s3\_stream](#input\_extended\_s3\_stream) | A name to identify the stream.It is required parameter, If you give value of extended\_s3\_stream in terraform.tfvars then we can deploy kinesis firehose delivery in destination extended s3 stream | `string` | `null` | no |
| <a name="input_extended_s3_stream_dynamic"></a> [extended\_s3\_stream\_dynamic](#input\_extended\_s3\_stream\_dynamic) | A name to identify the stream.It is required parameter, If you give value of extended\_s3\_stream\_dynamic in terraform.tfvars then we can deploy kinesis firehose delivery in destination extended s3 stream dynamic | `string` | `null` | no |
| <a name="input_http_endpoint_configuration"></a> [http\_endpoint\_configuration](#input\_http\_endpoint\_configuration) | Only Required when destination is http\_endpoint) Enhanced configuration options for the http\_endpoint. | <pre>list(object({<br>    url                = string<br>    name               = optional(string, null)<br>    access_key         = optional(string, null)<br>    buffering_size     = optional(string, null)<br>    buffering_interval = optional(string, null)<br>    role_arn           = string<br>    retry_duration     = optional(number, 300)<br>    s3_backup_mode     = optional(string, null)<br>    request_configuration = list(object({<br>      content_encoding = optional(string, null)<br>      common_attributes = list(object({<br>        name  = string<br>        value = optional(string, null)<br>      }))<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_redshift_configuration"></a> [redshift\_configuration](#input\_redshift\_configuration) | Only Required when destination is redshift) Enhanced configuration options for the redshift. | <pre>list(object({<br>    role_arn           = string<br>    cluster_jdbcurl    = string<br>    username           = string<br>    password           = string<br>    data_table_name    = string<br>    copy_options       = optional(string, null)<br>    data_table_columns = optional(string, null)<br>    s3_backup_mode     = optional(string, null)<br>    s3_backup_configuration = list(object({<br>      role_arn           = string<br>      bucket_arn         = string<br>      buffer_size        = optional(number, null)<br>      buffer_interval    = optional(number, null)<br>      compression_format = optional(string, null)<br>    }))<br>  }))</pre> | `[]` | no |
| <a name="input_redshift_name"></a> [redshift\_name](#input\_redshift\_name) | Name of Redshift destination.It is required parameter, If you give value of redshift\_name in terraform.tfvars then we can deploy kinesis firehose delivery in destination Redshift | `string` | `null` | no |
| <a name="input_s3_configuration"></a> [s3\_configuration](#input\_s3\_configuration) | Only Required when destination is redshift) Enhanced configuration options for the redshift. | <pre>list(object({<br>    role_arn           = string<br>    bucket_arn         = string<br>    buffer_size        = optional(number, null)<br>    buffer_interval    = optional(number, null)<br>    compression_format = optional(string, null)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_HTTP_endpoint"></a> [HTTP\_endpoint](#output\_HTTP\_endpoint) | kinesis firehose stream id |
| <a name="output_elasticsearch"></a> [elasticsearch](#output\_elasticsearch) | Kinesis firehose stream id |
| <a name="output_extended_s3_stream"></a> [extended\_s3\_stream](#output\_extended\_s3\_stream) | Kinesis firehose stream id |
| <a name="output_extended_s3_stream_dynamic"></a> [extended\_s3\_stream\_dynamic](#output\_extended\_s3\_stream\_dynamic) | Kinesis firehose stream id |
| <a name="output_redshift"></a> [redshift](#output\_redshift) | kinesis firehose stream id |

## Module

```
module "kinesis_firehose_delivery" {
  source                            = "../../../Modules/Analytics/kinesis_firehose"
  extended_s3_stream                = var.extended_s3_stream
  destination_S3                    = var.destination_S3
  tags                              = var.tags
  extended_s3_configuration         = var.extended_s3_configuration
  destination_redshift              = var.destination_redshift
  redshift_name                     = var.redshift_name
  s3_configuration                  = var.s3_configuration
  redshift_configuration            = var.redshift_configuration
  extended_s3_stream_dynamic        = var.extended_s3_stream_dynamic
  destination_S3_dynamic            = var.destination_S3_dynamic
  elasticsearch_name                = var.elasticsearch_name
  destination_elasticsearch         = var.destination_elasticsearch
  elasticsearch_configuration       = var.elasticsearch_configuration
  HTTP_endpoint_name                = var.HTTP_endpoint_name
  destination_HTTP                  = var.destination_HTTP
  http_endpoint_configuration       = var.http_endpoint_configuration
}

```
