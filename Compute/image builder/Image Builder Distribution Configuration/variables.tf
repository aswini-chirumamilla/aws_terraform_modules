#----------------------Variables for Distribution Configuration resource-----------------------------------------------------------#

variable "distribution_configuration_name" {
  description = "(Required) Name of the distribution configuration."
  type        = string
}

variable "distribution_configuration_description" {
  description = "(Required) Description of the distribution configuration."
  type        = string
}

variable "distribution" {
  description = "(Required) One or more configuration blocks with distribution settings."
  type = list(object({
    distribution_configuration_region = string                 # (Required) AWS Region for the distribution.
    license_configuration_arns        = optional(list(string)) # (Optional) Set of Amazon Resource Names (ARNs) of License Manager License Configurations.
    ami_distribution_configuration = optional(list(object({    # (Optional) Configuration block with Amazon Machine Image (AMI) distribution settings.
      ami_tags                    = optional(map(string))      # (Optional) Key-value map of tags to apply to the distributed AMI.
      distributed_ami_description = optional(string)           # (Optional) Description to apply to the distributed AMI.
      kms_key_id                  = optional(string)           # (Optional) Amazon Resource Name (ARN) of the Key Management Service (KMS) Key to encrypt the distributed AMI.
      distributed_ami_name        = optional(string)           # (Optional) Name to apply to the distributed AMI.
      target_account_ids          = optional(list(string))     # (Optional) Set of AWS Account identifiers to distribute the AMI.
      launch_permission = optional(list(object({               # (Optional) Configuration block of EC2 launch permissions to apply to the distributed AMI. 
        organization_arns        = optional(list(string))      # (Optional) Set of AWS Organization ARNs to assign.
        organizational_unit_arns = optional(list(string))      # (Optional) Set of AWS Organizational Unit ARNs to assign.
        user_groups              = optional(list(string))      # (Optional) Set of EC2 launch permission user groups to assign. Use all to distribute a public AMI.
        account_ids              = optional(list(string))      # (Optional) Set of AWS Account identifiers to assign.
      })))
    })))
    fast_launch_configuration = optional(list(object({ # (Optional) Set of Windows faster-launching configurations to use for AMI distribution.
      account_id            = string                   # (Required) The owner account ID for the fast-launch enabled Windows AMI.
      fast_launch_enabled   = bool                     # (Required) A Boolean that represents the current state of faster launching for the Windows AMI. Set to true to start using Windows faster launching, or false to stop using it.
      max_parallel_launches = optional(number)         # (Optional) The maximum number of parallel instances that are launched for creating resources.
      launch_template = optional(list(object({         # (Optional) Configuration block for the launch template that the fast-launch enabled Windows AMI uses when it launches Windows instances to create pre-provisioned snapshots.
        launch_template_id      = optional(string)     # (Optional) The ID of the launch template to use for faster launching for a Windows AMI.
        launch_template_name    = optional(string)     # (Optional) The name of the launch template to use for faster launching for a Windows AMI.
        launch_template_version = optional(string)     # (Optional) The version of the launch template to use for faster launching for a Windows AMI.
      })))
      snapshot_configuration = optional(list(object({ # (Optional) Configuration block for managing the number of snapshots that are created from pre-provisioned instances for the Windows AMI when faster launching is enabled. 
        target_resource_count = optional(number)      # (Optional) The number of pre-provisioned snapshots to keep on hand for a fast-launch enabled Windows AMI.
      })))
    })))
    launch_template_configuration = optional(list(object({ # (Optional) Set of launch template configuration settings that apply to image distribution. 
      launch_template_id = string                          # (Required) The ID of the Amazon EC2 launch template to use.
      account_id         = optional(string)                # The account ID that this configuration applies to.
      default            = optional(bool)                  # (Optional) Indicates whether to set the specified Amazon EC2 launch template as the default launch template. Defaults to true.
    })))
  }))
}

#-----------------------------Tags Variables------------------------------------------------------------
variable "tags" {
  description = "Key-value map of resource tags for the distribution configuration. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
}