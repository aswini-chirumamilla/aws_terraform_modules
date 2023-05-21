resource "aws_imagebuilder_image_recipe" "windows_recipe" {
  name              = var.recipe_name
  parent_image      = var.parent_image
  version           = var.recipe_version
  description       = var.recipe_description
  tags              = var.tags
  user_data_base64  = var.user_data_base64
  working_directory = var.working_directory

  block_device_mapping {
    device_name  = var.device_name
    no_device    = var.no_device
    virtual_name = var.virtual_name

    ebs {
      delete_on_termination = var.delete_on_termination
      encrypted             = var.encrypted
      iops                  = var.iops
      kms_key_id            = var.kms_key_id
      snapshot_id           = var.snapshot_id
      throughput            = var.throughput
      volume_size           = var.volume_size
      volume_type           = var.volume_type
    }
  }

  dynamic "component" {
    for_each = var.component
    content {
      component_arn = component.value.component_arn
      dynamic "parameter" {
        for_each = component.value.parameter
        content {
          name  = parameter.value.para_name
          value = parameter.value.para_value
        }
      }
    }
  }
}