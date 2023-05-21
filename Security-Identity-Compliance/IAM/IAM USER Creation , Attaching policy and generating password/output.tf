output "Policy-ARNs" {
  description = "ARN of the policy created"
  value       = module.iam_user.Policy-ARNs
}

output "User-names" {
  description = "IAM user-name"
  value       = module.iam_user.User-names
}