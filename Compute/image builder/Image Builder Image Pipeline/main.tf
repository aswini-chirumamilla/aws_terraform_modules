resource "aws_imagebuilder_image_pipeline" "tf_image_pipeline" {
  image_recipe_arn                 = var.image_recipe_arn
  infrastructure_configuration_arn = var.infrastructure_configuration_arn
  name                             = var.imagebuilder_image_pipeline_name
  container_recipe_arn             = var.container_recipe_arn
  distribution_configuration_arn   = var.distribution_configuration_arn
  description                      = var.description
  enhanced_image_metadata_enabled  = var.enhanced_image_metadata_enabled
  status                           = var.pipeline_status
  tags                             = var.tags

  image_tests_configuration {
    image_tests_enabled = var.image_tests_enabled
    timeout_minutes     = var.timeout_minutes
  }

  schedule {
    schedule_expression = var.schedule
  }
}