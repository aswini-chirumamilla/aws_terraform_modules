## Image Builder Distribution Configuration
 This module creates and manages Imagebuilder Distribution Configuration. Distribution configurations include the output AMI name, specific Region settings for encryption, launch permissions, and AWS accounts, organizations, and organizational units (OUs) that can launch the output AMI, and license configurations. 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.54.0 |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0 |

## Resources

| Name | Type |
|------|------|
| [aws_imagebuilder_distribution_configuration.distribution_configuration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_distribution_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_distribution"></a> [distribution](#input\_distribution) | (Required) One or more configuration blocks with distribution settings. | <pre>list(object({<br>    distribution_configuration_region = string                 # (Required) AWS Region for the distribution.<br>    license_configuration_arns        = optional(list(string)) # (Optional) Set of Amazon Resource Names (ARNs) of License Manager License Configurations.<br>    ami_distribution_configuration = optional(list(object({    # (Optional) Configuration block with Amazon Machine Image (AMI) distribution settings.<br>      ami_tags                    = optional(map(string))      # (Optional) Key-value map of tags to apply to the distributed AMI.<br>      distributed_ami_description = optional(string)           # (Optional) Description to apply to the distributed AMI.<br>      kms_key_id                  = optional(string)           # (Optional) Amazon Resource Name (ARN) of the Key Management Service (KMS) Key to encrypt the distributed AMI.<br>      distributed_ami_name        = optional(string)           # (Optional) Name to apply to the distributed AMI.<br>      target_account_ids          = optional(list(string))     # (Optional) Set of AWS Account identifiers to distribute the AMI.<br>      launch_permission = optional(list(object({               # (Optional) Configuration block of EC2 launch permissions to apply to the distributed AMI. <br>        organization_arns        = optional(list(string))      # (Optional) Set of AWS Organization ARNs to assign.<br>        organizational_unit_arns = optional(list(string))      # (Optional) Set of AWS Organizational Unit ARNs to assign.<br>        user_groups              = optional(list(string))      # (Optional) Set of EC2 launch permission user groups to assign. Use all to distribute a public AMI.<br>        account_ids              = optional(list(string))      # (Optional) Set of AWS Account identifiers to assign.<br>      })))<br>    })))<br>    fast_launch_configuration = optional(list(object({ # (Optional) Set of Windows faster-launching configurations to use for AMI distribution.<br>      account_id            = string                   # (Required) The owner account ID for the fast-launch enabled Windows AMI.<br>      fast_launch_enabled   = bool                     # (Required) A Boolean that represents the current state of faster launching for the Windows AMI. Set to true to start using Windows faster launching, or false to stop using it.<br>      max_parallel_launches = optional(number)         # (Optional) The maximum number of parallel instances that are launched for creating resources.<br>      launch_template = optional(list(object({         # (Optional) Configuration block for the launch template that the fast-launch enabled Windows AMI uses when it launches Windows instances to create pre-provisioned snapshots.<br>        launch_template_id      = optional(string)     # (Optional) The ID of the launch template to use for faster launching for a Windows AMI.<br>        launch_template_name    = optional(string)     # (Optional) The name of the launch template to use for faster launching for a Windows AMI.<br>        launch_template_version = optional(string)     # (Optional) The version of the launch template to use for faster launching for a Windows AMI.<br>      })))<br>      snapshot_configuration = optional(list(object({ # (Optional) Configuration block for managing the number of snapshots that are created from pre-provisioned instances for the Windows AMI when faster launching is enabled. <br>        target_resource_count = optional(number)      # (Optional) The number of pre-provisioned snapshots to keep on hand for a fast-launch enabled Windows AMI.<br>      })))<br>    })))<br>    launch_template_configuration = optional(list(object({ # (Optional) Set of launch template configuration settings that apply to image distribution. <br>      launch_template_id = string                          # (Required) The ID of the Amazon EC2 launch template to use.<br>      account_id         = optional(string)                # The account ID that this configuration applies to.<br>      default            = optional(bool)                  # (Optional) Indicates whether to set the specified Amazon EC2 launch template as the default launch template. Defaults to true.<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_distribution_configuration_description"></a> [distribution\_configuration\_description](#input\_distribution\_configuration\_description) | (Optional) Description of the distribution configuration. | `string` | `null` | no |
| <a name="input_distribution_configuration_name"></a> [distribution\_configuration\_name](#input\_distribution\_configuration\_name) | (Required) Name of the distribution configuration. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Key-value map of resource tags for the distribution configuration. If configured with a provider default\_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_distribution_configuration_arn"></a> [distribution\_configuration\_arn](#output\_distribution\_configuration\_arn) | ARN of the distribution configuration |
| <a name="output_distribution_configuration_creation_date"></a> [distribution\_configuration\_creation\_date](#output\_distribution\_configuration\_creation\_date) | Date the distribution configuration was created. |
| <a name="output_distribution_configuration_updation_date"></a> [distribution\_configuration\_updation\_date](#output\_distribution\_configuration\_updation\_date) | Date the distribution configuration was updated. |

## Modules

```
module "imagebuilder_distribution_configuration" {
  source = "../../../../Modules/Compute/image builder/Image Builder Distribution Configuration"
  
  distribution_configuration_name        = "terraform-distribution-configuration-1"
distribution_configuration_description = "Distribution configuration deployed by Terraform"
distribution = [{
  distribution_configuration_region = "us-east-2"
  license_configuration_arns        = ["arn:aws:license-manager:us-east-2:051171442365:license-configuration:lic-36c32ab8012544ce48eb0f7bbf98b955"] #required
  ami_distribution_configuration = [{
    ami_tags = {
      config_block = "ami_distribution_configuration"
      environment  = "Development"
    }
    distributed_ami_description = "Testing Distributed AMI"
    kms_key_id                  = "4dc3e4c6-b098-425c-813b-67796f7b8e11"
    distributed_ami_name        = "distri-config"
    target_account_ids          = ["051171442365"]
    launch_permission = [{
      organization_arns        = ["arn:aws:organizations::908416975963:organization/o-12ls3dh2ni"]
      account_ids              = ["051171442365"]
    }]
  }]
  fast_launch_configuration = []                    #Fast launch configuration AMI is not available in AWS Console yet , hence empty list has been given for input .
  launch_template_configuration = [{
    launch_template_id = "lt-07ce01f2907930647"
    account_id         = "051171442365"
    default            = true
  }]
}]

tags = {
  environment = "Development"
  module_name = "Distribution Configuration"
 }
}
