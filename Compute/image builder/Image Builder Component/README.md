## Image Builder Component
 This module creates and manages Imagebuilder Component.

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
| [aws_imagebuilder_component.component](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_component) | resource |
| [local_file.input](https://registry.terraform.io/providers/hashicorp/local/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_change_description"></a> [change\_description](#input\_change\_description) | Change description of Component | `string` | `null` | no |
| <a name="input_component_description"></a> [component\_description](#input\_component\_description) | Description of component | `string` | n/a | yes |
| <a name="input_component_document"></a> [component\_document](#input\_component\_document) | Name of file in which YAML script is written , which has the data of the component. Exactly one of component\_document or uri should be specified. | `string` | `null` | no |
| <a name="input_component_name"></a> [component\_name](#input\_component\_name) | Name of Image Builder component | `string` | n/a | yes |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | Amazon Resource Name (ARN) of the Key Management Service (KMS) Key used to encrypt the component. | `string` | `null` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | OS platform for image component (Either Windows or Linux) | `string` | `"Windows"` | no |
| <a name="input_supported_os_versions"></a> [supported\_os\_versions](#input\_supported\_os\_versions) | Set of Operating Systems (OS) supported by the component. | `list(string)` | <pre>[<br>  "Microsoft Windows Server 2019"<br>]</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags for the component. | `map(string)` | n/a | yes |
| <a name="input_uri"></a> [uri](#input\_uri) | S3 URI with data of the component. Exactly one of uri or component\_document can be specified. | `string` | `null` | no |
| <a name="input_version_specification"></a> [version\_specification](#input\_version\_specification) | Version of Image Builder Component | `string` | `"1.0.0"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_component_arn"></a> [component\_arn](#output\_component\_arn) | Component ARN of the image builder |

## Modules
```
module "imagebuilder_component" {
  source = "../../../../Modules/Compute/image builder/Image Builder Component"

component_name        = "Windows_base_component"
platform              = "Windows"
version_specification = "1.0.0"
component_description = "Windows supported OS version component"
change_description    = null
kms_key_id            = null
supported_os_versions = ["Microsoft Windows Server 2019"]
uri                   = null
component_document    = "./terraformdata.yml"
tags                  = { name = "Imagebuilder_component"
                          environment = "dev" }
}
```