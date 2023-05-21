output "distribution_configuration_arn" {
  description = "ARN of the distribution configuration"
  value       = module.imagebuilder_distribution_configuration.distribution_configuration_arn
}

output "distribution_configuration_creation_date" {
  description = "Date the distribution configuration was created."
  value       = module.imagebuilder_distribution_configuration.distribution_configuration_creation_date
}

output "distribution_configuration_updation_date" {
  description = "Date the distribution configuration was updated."
  value       = module.imagebuilder_distribution_configuration.distribution_configuration_updation_date
}