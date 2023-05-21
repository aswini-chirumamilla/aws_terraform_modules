## Imagebuilder Infrastructure Configuration

This module creates and manages Imagebuilder Infrastructure Configuration. 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.48.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.48.0 |

## Resources

| Name | Type |
|------|------|
| [aws_imagebuilder_infrastructure_configuration.infra_config](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_infrastructure_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Whether logging has to be enabled for the Infrastructure Configuration or  not | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_imagebuilder\_infra\_config\_tags) | tags for imagebuilder infrastructure configuration | `map(string)` | n/a | yes |
| <a name="input_infra_config_description"></a> [infra\_config\_description](#input\_infra\_config\_description) | Description of the infrastructure configuration | `string` | n/a | yes |
| <a name="input_infra_config_name"></a> [infra\_config\_name](#input\_infra\_config\_name) | Name of the infrastructure configuration resource | `string` | n/a | yes |
| <a name="input_instance_profile_name"></a> [instance\_profile\_name](#input\_instance\_profile\_name) | Name of IAM instance profile for launch configuration | `string` | n/a | yes |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | Type of instance being used for Image builder configuration | `list(string)` | <pre>[<br>  "t2.nano",<br>  "t3.micro"<br>]</pre> | no |
| <a name="input_key_pair"></a> [key\_pair](#input\_key\_pair) | Key Pair values | `string` | `null` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Specifies logging | <pre>object({<br>    s3_bucket_name = string<br>    s3_key_prefix  = string<br>  })</pre> | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | ID of security groups required for Image Builder Configuration | `list(string)` | `null` | no |
| <a name="input_sns_topic_arn"></a> [sns\_topic\_arn](#input\_sns\_topic\_arn) | ARN of SNS | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID | `string` | `"subnet-0a18d7f46636b65c6"` | no |
| <a name="input_terminate_instance_on_failure"></a> [terminate\_instance\_on\_failure](#input\_terminate\_instance\_on\_failure) | Whether instance should be terminated when the pipeline fails (Default value as false) | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_infrastructure_configuration_arn"></a> [infrastructure\_configuration\_arn](#output\_infrastructure\_configuration\_arn) | Infrastructure Configuration ARN of the image builder |

## Modules
```
module "imagebuilder_infrastructure_configuration" {
  source = "../../../../Modules/Compute/image builder/Image Builder Infrastructure Configuration"

infra_config_name             = "new_infra_configuration_windows_base_latest"
instance_profile_name         = "imgbuilder-tf-role"
infra_config_description      = "windows-base-infra-config"
instance_types                = ["t3.micro"]
key_pair                      = "img-bld-1"
security_group_ids            = ["sg-0a98f0475ad2cf064"]
sns_topic_arn                 = null
subnet_id                     = "subnet-0a18d7f46636b65c6"
terminate_instance_on_failure = false
enable_logging                = false
logging                       = null
tags                          = { name = "ImgConfig"
                                  environment = "dev" }
}
```
