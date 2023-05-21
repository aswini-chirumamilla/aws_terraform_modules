output "imagebuilder_pipeline_arn" {
  value       = aws_imagebuilder_image_pipeline.tf_image_pipeline.arn
  description = "Image Pipeline ARN of the image builder "
}

output "imagebuilder_pipeline_platform" {
  value       = aws_imagebuilder_image_pipeline.tf_image_pipeline.platform
  description = "Platform of the Image Pipeline "
}

output "imagebuilder_pipeline_date_updated" {
  value       = aws_imagebuilder_image_pipeline.tf_image_pipeline.date_updated
  description = "The date on which image pipeline was updated "
}

