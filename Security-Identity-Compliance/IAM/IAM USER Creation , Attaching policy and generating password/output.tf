output "Policy-ARNs" {
  description = "ARN of the policy created"
  value       = aws_iam_policy.custom_policy.*.policy
}

output "User-names" {
  description = "IAM user-name"
  value       = aws_iam_user.users.*.name
}
