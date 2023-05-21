module "imagebuilder_image_pipeline" {
  source = "../../../../Modules/Compute/image builder/Image Builder Image Pipeline"

  image_recipe_arn                 = var.image_recipe_arn
  infrastructure_configuration_arn = var.infrastructure_configuration_arn
  imagebuilder_image_pipeline_name = var.imagebuilder_image_pipeline_name
  container_recipe_arn             = var.container_recipe_arn
  distribution_configuration_arn   = var.distribution_configuration_arn
  description                      = var.description
  enhanced_image_metadata_enabled  = var.enhanced_image_metadata_enabled
  pipeline_status                  = var.pipeline_status
  image_tests_enabled              = var.image_tests_enabled
  timeout_minutes                  = var.timeout_minutes
  schedule                         = var.schedule
  tags                             = var.tags
}