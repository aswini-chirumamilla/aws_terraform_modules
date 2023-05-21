## Imagebuilder Image Recipe

This module creates and Manages Imagebuilder Image Recipe.
This module is only for Linux base OS platform because , SSM agent block is not compatible with Windows , which is included here. (Reference : https://github.com/hashicorp/terraform-provider-aws/issues/23569)

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
| [aws_imagebuilder_image_recipe.recipe](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_image_recipe) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_component"></a> [component](#input\_component) | Ordered configuration block(s) with components for the image recipe.  | <pre>list(object({<br>    component_arn = string<br>    parameter = optional(list(object({<br>      para_name  = string<br>      para_value = string<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | Whether to delete the volume on termination | `bool` | `true` | no |
| <a name="input_device_name"></a> [device\_name](#input\_device\_name) | Name of the device. For example, /dev/sda or /dev/xvdb | `string` | `"/dev/xvdb"` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Whether to encrypt the volume. Defaults to unset, which is the value inherited from the parent image | `bool` | `null` | no |
| <a name="input_iops"></a> [iops](#input\_iops) | Number of Input/Output (I/O) operations per second to provision for an io1 or io2 volume | `number` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Amazon Resource Name (ARN) of the Key Management Service (KMS) Key for encryption. | `string` | `null` | no |
| <a name="input_no_device"></a> [no\_device](#input\_no\_device) | Set to true to remove a mapping from the parent image | `bool` | `true` | no |
| <a name="input_parent_image"></a> [parent\_image](#input\_parent\_image) | Platform of the image recipe. (EC2 Image AMI ID or Imagebuilder ARN) | `string` | n/a | yes |
| <a name="input_recipe_description"></a> [recipe\_description](#input\_recipe\_description) | Description of the image recipe | `string` | n/a | yes |
| <a name="input_recipe_name"></a> [recipe\_name](#input\_recipe\_name) | Name of image recipe | `string` | n/a | yes |
| <a name="input_recipe_version"></a> [recipe\_version](#input\_recipe\_version) | Version of the image recipe | `string` | `"1.0.0"` | no |
| <a name="input_snapshot_id"></a> [snapshot\_id](#input\_snapshot\_id) | Identifier of the EC2 Volume Snapshot | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | tags for imagebuilder recipe | `map(string)` | n/a | yes |
| <a name="input_throughput"></a> [throughput](#input\_throughput) | For GP3 volumes only. The throughput in MiB/s that the volume supports | `any` | `null` | no |
| <a name="input_uninstall_after_build"></a> [uninstall\_after\_build](#input\_uninstall\_after\_build) | Whether to remove the Systems Manager Agent after the image has been built. Defaults to false | `bool` | `false` | no |
| <a name="input_user_data_base64"></a> [user\_data\_base64](#input\_user\_data\_base64) | Base64 encoded user data. Use this to provide commands or a command script to run when you launch your build instance | `string` | `null` | no |
| <a name="input_virtual_name"></a> [virtual\_name](#input\_virtual\_name) | Virtual device name. For example, ephemeral0. Instance store volumes are numbered starting from 0 | `string` | `"ephemeral0"` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of volume in GiB | `number` | `100` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Type of volume (Example : gp2 or io2) | `string` | `"gp2"` | no |
| <a name="input_working_directory"></a> [working\_directory](#input\_working\_directory) | The working directory to be used during build and test workflows | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_recipe_arn"></a> [image\_recipe\_arn](#output\_image\_recipe\_arn) | Image Recipe ARN of the image builder |

## Modules
```
module "imagebuilder_image_recipe_linux" {
  source = "../../../../Modules/Compute/image builder/Image Builder Image Recipe - Linux"

recipe_name        = "img_recipe_linux"
parent_image       = "ami-0fa3a140e61622d50"
recipe_version     = "1.0.0"
recipe_description = "recipe_test"
tags = { name = "ImgRecipe"
environment = "dev" }
user_data_base64      = null
working_directory     = null
uninstall_after_build = true
device_name           = "/dev/xvdb"
no_device             = true
virtual_name          = "RecVName"
delete_on_termination = true
encrypted             = null
iops                  = null
kms_key_id            = null
snapshot_id           = null
throughput            = null
volume_size           = 100
volume_type           = "gp2"
component             = [
                          {
                            component_arn = "arn:aws:imagebuilder:us-east-1:051171442365:component/linux-component/1.0.0/1"
                            parameter = []
                          }
                        ]
}
```