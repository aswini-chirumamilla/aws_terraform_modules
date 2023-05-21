output "infrastructure_configuration_arn" {
  value       = aws_imagebuilder_infrastructure_configuration.infra_config.arn
  description = "Infrastructure Configuration ARN of the image builder "
}
