output "distribution_configuration_arn" {
  description = "ARN of the distribution configuration"
  value       = aws_imagebuilder_distribution_configuration.distribution_configuration.arn
}

output "distribution_configuration_creation_date" {
  description = "Date the distribution configuration was created."
  value       = aws_imagebuilder_distribution_configuration.distribution_configuration.date_created
}

output "distribution_configuration_updation_date" {
  description = "Date the distribution configuration was updated."
  value       = aws_imagebuilder_distribution_configuration.distribution_configuration.date_updated
}