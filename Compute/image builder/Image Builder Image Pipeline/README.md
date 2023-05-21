## Imagebuilder Image Pipeline

This module creates and manages an Imagebuilder Image Pipeline.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.49.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.49.0 |

## Resources

| Name | Type |
|------|------|
| [aws_imagebuilder_image_pipeline.tf_image_pipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_image_pipeline) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_recipe_arn"></a> [container\_recipe\_arn](#input\_container\_recipe\_arn) | ARN of container recipe | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of Image Pipeline | `string` | n/a | yes |
| <a name="input_distribution_configuration_arn"></a> [distribution\_configuration\_arn](#input\_distribution\_configuration\_arn) | ARN of distribution configuration in Image Builder | `string` | `null` | no |
| <a name="input_enhanced_image_metadata_enabled"></a> [enhanced\_image\_metadata\_enabled](#input\_enhanced\_image\_metadata\_enabled) | Whether additional information about the image being created is collected | `bool` | `true` | no |
| <a name="tags"></a> [tags](#input\tags) | Tags for imagebuilder image pipeline | `map(string)` | n/a | yes |
| <a name="input_image_recipe_arn"></a> [image\_recipe\_arn](#input\_image\_recipe\_arn) | ARN of image recipe | `string` | `null` | no |
| <a name="input_image_tests_enabled"></a> [image\_tests\_enabled](#input\_image\_tests\_enabled) | Whether image tests are enabled | `bool` | `true` | no |
| <a name="input_imagebuilder_image_pipeline_name"></a> [imagebuilder\_image\_pipeline\_name](#input\_imagebuilder\_image\_pipeline\_name) | Image Pipeline Name | `string` | n/a | yes |
| <a name="input_infrastructure_configuration_arn"></a> [infrastructure\_configuration\_arn](#input\_infrastructure\_configuration\_arn) | ARN of infrastructure configuration in Image Builder | `string` | n/a | yes |
| <a name="input_pipeline_status"></a> [pipeline\_status](#input\_pipeline\_status) | Status of the image pipeline. Valid values are DISABLED and ENABLED. Defaults to ENABLED | `string` | `"ENABLED"` | no |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | Cron expression of how often the pipeline start condition is evaluated | `string` | `"cron(30 10 1 * *)"` | no |
| <a name="input_timeout_minutes"></a> [timeout\_minutes](#input\_timeout\_minutes) | Number of minutes before image tests time out. Valid values are between 60 and 1440. Defaults to 720 | `number` | `720` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_imagebuilder_pipeline_arn"></a> [imagebuilder\_pipeline\_arn](#output\_imagebuilder\_pipeline\_arn) | Image Pipeline ARN of the image builder |
| <a name="output_imagebuilder_pipeline_date_updated"></a> [imagebuilder\_pipeline\_date\_updated](#output\_imagebuilder\_pipeline\_date\_updated) | The date on which image pipeline was updated |
| <a name="output_imagebuilder_pipeline_platform"></a> [imagebuilder\_pipeline\_platform](#output\_imagebuilder\_pipeline\_platform) | Platform of the Image Pipeline |

## Modules
```
module "imagebuilder_image_pipeline" {
  source = "../../../../Modules/Compute/image builder/Image Builder Image Pipeline"

image_recipe_arn                 = "arn:aws:imagebuilder:us-east-1:051171442365:image-recipe/windows-os-image-recipe-new/1.0.0"
infrastructure_configuration_arn = "arn:aws:imagebuilder:us-east-1:051171442365:infrastructure-configuration/new-infra-configuration-windows-base-latest"
imagebuilder_image_pipeline_name = "image_pipeline_windows_latest"
container_recipe_arn             = null
distribution_configuration_arn   = null
description                      = "Image pipeline"
enhanced_image_metadata_enabled  = true
pipeline_status                  = "ENABLED"
tags                             = { name = "Imagebuilder_Image_pipeline"
                                     environment = "dev" }
image_tests_enabled              = true
timeout_minutes                  = 720
schedule                         = "cron(30 10 1 * *)"
}
```