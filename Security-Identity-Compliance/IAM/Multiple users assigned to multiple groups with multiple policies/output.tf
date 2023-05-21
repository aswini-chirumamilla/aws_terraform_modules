output "group_names" {
  description = "Name of the Group created"
  value       = aws_iam_group.group.*.name
}

output "user_names" {
  description = "Name of the users created"
  value       = aws_iam_user.user.*.name
}

output "policy_names" {
  description = "Name of the policies created"
  value       = aws_iam_policy.policy.*.name
}