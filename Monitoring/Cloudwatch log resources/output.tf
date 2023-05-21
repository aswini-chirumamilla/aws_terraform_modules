output "cloudwatch_log_group_arn" {
  value       = aws_cloudwatch_log_group.cloudwatch_log_group.arn
  description = "ARN of the cloudwatch log group"
}

output "cloudwatch_log_stream_arn" {
  value       = aws_cloudwatch_log_stream.cloudwatch_log_stream.arn
  description = "ARN of the cloudwatch log stream"
}

output "cloudWatch_log_destination_arn" {
  value       = aws_cloudwatch_log_destination.cloudwatch_destination.arn
  description = "ARN of the cloudwatch log destination"
}

output "cloudwatch_log_metric_filter_id" {
  value       = aws_cloudwatch_log_metric_filter.cloudwatch_metric_filter.id
  description = "ID of the cloudwatch log metric filter"

}

output "cloudwatch_subscription_filter_id" {
  value       = aws_cloudwatch_log_subscription_filter.cloudwatch_subscription_filter.id
  description = "ID of the cloudwatch log subscription filter"

}