# Kinesis Video Stream 
Creates a resource to manage a kinesis video stream.

## Prerequisite
* KMS key id is required.

## Terraform version
| Name | Version |
|------|---------|
| <a name="Terraform"></a> [Terraform](#Terraform) | 1.3.9  |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) |  4.55.0|


## Resources

| Name | Type |
|------|------|
| [aws_kinesis_video_stream](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kinesis_video_stream) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_retention_in_hours"></a> [data\_retention\_in\_hours](#input\_data\_retention\_in\_hours) | The number of hours that you want to retain the data in the stream. Kinesis Video Streams retains the data in a data store that is associated with the stream. The default value is 0, indicating that the stream does not persist data. | `number` | n/a | yes |
| <a name="input_device_name"></a> [device\_name](#input\_device\_name) | The name of the device that is writing to the stream. In the current implementation, Kinesis Video Streams does not use this name. | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ID of the AWS Key Management Service (AWS KMS) key that you want Kinesis Video Streams to use to encrypt stream data. If no key ID is specified, the default, Kinesis Video-managed key (aws/kinesisvideo) is used. | `string` | `null` | no |
| <a name="input_media_type"></a> [media\_type](#input\_media\_type) | The media type of the stream. Consumers of the stream can use this information when processing the stream. For more information about media types, see Media Types. If you choose to specify the MediaType, see Naming Requirements for guidelines. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | n/a | yes |
| <a name="input_video_stream"></a> [video\_stream](#input\_video\_stream) | A name to identify the stream. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_video_stream_arn"></a> [video\_stream\_arn](#output\_video\_stream\_arn) | Kinesis video stream id |

### Module usage ####

```
 module "video_stream" {
  source                  = "../../../Modules/Analytics/kinesis_video_stream"
  video_stream            = var.video_stream
  data_retention_in_hours = var.data_retention_in_hours
  device_name             = var.device_name
  media_type              = var.media_type
  kms_key_id              = var.kms_key_id
  tags                    = var.tags
}

```
<!-- END_TF_DOCS -->
