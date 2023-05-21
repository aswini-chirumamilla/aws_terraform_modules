resource "aws_imagebuilder_distribution_configuration" "distribution_configuration" {
  name        = var.distribution_configuration_name
  description = var.distribution_configuration_description
  tags        = var.tags
  dynamic "distribution" {
    for_each = var.distribution
    content {
      region                     = distribution.value.distribution_configuration_region
      license_configuration_arns = distribution.value.license_configuration_arns
      dynamic "ami_distribution_configuration" {
        for_each = lookup(distribution.value, "ami_distribution_configuration", [])
        content {
          ami_tags           = ami_distribution_configuration.value.ami_tags
          description        = ami_distribution_configuration.value.distributed_ami_description
          kms_key_id         = ami_distribution_configuration.value.kms_key_id
          name               = "${ami_distribution_configuration.value.distributed_ami_name}-{{ imagebuilder:buildDate }}"
          target_account_ids = ami_distribution_configuration.value.target_account_ids
          dynamic "launch_permission" {
            for_each = lookup(ami_distribution_configuration.value, "launch_permission", [])
            content {
              organization_arns        = launch_permission.value.organization_arns
              organizational_unit_arns = launch_permission.value.organizational_unit_arns
              user_groups              = launch_permission.value.user_groups
              user_ids                 = launch_permission.value.account_ids
            }
          }
        }
      }
      dynamic "fast_launch_configuration" {
        for_each = lookup(distribution.value, "fast_launch_configuration", [])
        content {
          account_id            = fast_launch_configuration.value.account_id
          enabled               = fast_launch_configuration.value.fast_launch_enabled
          max_parallel_launches = fast_launch_configuration.value.max_parallel_launches
          dynamic "launch_template" {
            for_each = lookup(fast_launch_configuration.value, "launch_template", [])
            content {
              launch_template_id      = launch_template.value.launch_template_id
              launch_template_name    = launch_template.value.launch_template_name
              launch_template_version = launch_template.value.launch_template_version
            }
          }
          dynamic "snapshot_configuration" {
            for_each = lookup(fast_launch_configuration.value, "snapshot_configuration", [])
            content {
              target_resource_count = snapshot_configuration.value.target_resource_count
            }
          }
        }
      }
      dynamic "launch_template_configuration" {
        for_each = lookup(distribution.value, "launch_template_configuration", [])
        content {
          launch_template_id = launch_template_configuration.value.launch_template_id
          account_id         = launch_template_configuration.value.account_id
          default            = launch_template_configuration.value.default
        }
      }
    }
  }
}