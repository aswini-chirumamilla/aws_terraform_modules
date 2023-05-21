output "group_name" {
  description = "Name of the Group created"
  value       = module.iam_group.group_name
}

output "group_arn" {
  description = "ARN of the Group created"
  value       = module.iam_group.group_arn
}

output "policy_arn" {
  description = "ARN of the policy created"
  value       = data.aws_iam_policy.custom_policy.*.arn
}

