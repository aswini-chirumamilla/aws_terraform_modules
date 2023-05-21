output "service_arn" {
  description = "The App Runner Service ARN"
  value       = try(module.apprunnner.service_arn)
}

output "service_id" {
  description = "An alphanumeric ID that App Runner generated for this service. Unique within the AWS Region"
  value       = try(module.apprunnner.service_id)
}

output "service_url" {
  description = "The App Runner Service URL"
  value       = try(module.apprunnner.service_url)
}

output "service_status" {
  description = "The App Runner Service Status"
  value       = try(module.apprunnner.service_status)
}