output "imagebuilder_pipeline_arn" {
  value       = module.imagebuilder_image_pipeline.imagebuilder_pipeline_arn
  description = "Image Pipeline ARN of the image builder "
}

output "imagebuilder_pipeline_platform" {
  value       = module.imagebuilder_image_pipeline.imagebuilder_pipeline_platform
  description = "Platform of the Image Pipeline "
}

output "imagebuilder_pipeline_date_updated" {
  value       = module.imagebuilder_image_pipeline.imagebuilder_pipeline_date_updated
  description = "The date on which image pipeline was updated "
}

