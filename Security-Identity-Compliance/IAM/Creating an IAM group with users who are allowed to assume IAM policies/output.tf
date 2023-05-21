output "group_name" {
  description = "Name of the Group created"
  value       = aws_iam_group.new_group.name
}

output "group_arn" {
  description = "ARN of the Group created"
  value       = aws_iam_group.new_group.arn
}

output "policy_arn" {
  description = "ARN of the policy created"
  value       = data.aws_iam_policy.custom_policy.*.arn
}

