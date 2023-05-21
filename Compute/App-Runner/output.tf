output "service_arn" {
  description = "The App Runner Service ARN"
  value       = try(aws_apprunner_service.apprunner_service.*.arn, "")
}

output "service_id" {
  description = "An alphanumeric ID that App Runner generated for this service. Unique within the AWS Region"
  value       = try(aws_apprunner_service.apprunner_service.*.service_id, "")
}

output "service_url" {
  description = "The App Runner Service URL"
  value       = try(aws_apprunner_service.apprunner_service.*.service_url, "")
}

output "service_status" {
  description = "The App Runner Service Status"
  value       = try(aws_apprunner_service.apprunner_service.*.status, "")
}
