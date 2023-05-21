module "imagebuilder_image_recipe_linux" {
  source = "../../../../Modules/Compute/image builder/Image Builder Image Recipe - Linux"

  recipe_name           = var.recipe_name
  parent_image          = var.parent_image
  recipe_version        = var.recipe_version
  recipe_description    = var.recipe_description
  tags                  = var.tags
  user_data_base64      = var.user_data_base64
  working_directory     = var.working_directory
  uninstall_after_build = var.uninstall_after_build
  device_name           = var.device_name
  no_device             = var.no_device
  virtual_name          = var.virtual_name
  delete_on_termination = var.delete_on_termination
  encrypted             = var.encrypted
  iops                  = var.iops
  kms_key_id            = var.kms_key_id
  snapshot_id           = var.snapshot_id
  throughput            = var.throughput
  volume_size           = var.volume_size
  volume_type           = var.volume_type
  component             = var.component
}