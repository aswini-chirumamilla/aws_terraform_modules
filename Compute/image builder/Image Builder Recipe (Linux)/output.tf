output "image_recipe_arn" {
  value       = aws_imagebuilder_image_recipe.recipe.arn
  description = "Image Recipe ARN of the image builder "
}
