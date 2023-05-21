output "secret_arn" {
  value       = module.aws_secretsmanager_secret_version
  description = "The ARN of secret manager"
}


