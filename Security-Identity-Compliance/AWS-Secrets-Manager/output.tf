output "secret_ARN" {
  value       = aws_secretsmanager_secret.aws_secret.arn
  description = "The ARN of secret manager"
}

