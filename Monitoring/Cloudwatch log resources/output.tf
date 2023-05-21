output "cloudwatch_log_group_arn" {
  value       = module.cloudwatch_log_resources.cloudwatch_log_group_arn
  description = "ARN of the cloudwatch log group"
}

output "cloudwatch_log_stream_arn" {
  value       = module.cloudwatch_log_resources.cloudwatch_log_stream_arn
  description = "ARN of the cloudwatch log stream"
}

output "cloudWatch_log_destination_arn" {
  value       = module.cloudwatch_log_resources.cloudWatch_log_destination_arn
  description = "ARN of the cloudwatch log destination"
}

output "cloudwatch_log_metric_filter_id" {
  value       = module.cloudwatch_log_resources.cloudwatch_log_metric_filter_id
  description = "ID of the cloudwatch log metric filter"
}

output "cloudwatch_subscription_filter_id" {
  value       = module.cloudwatch_log_resources.cloudwatch_subscription_filter_id
  description = "ID of the cloudwatch log subscription filter"

}
