output "group_names" {
  description = "Name of the Group created"
  value       = module.iam_group_mutiple.group_names
}

output "user_names" {
  description = "Name of the users created"
  value       = module.iam_group_mutiple.user_names
}

output "policy_names" {
  description = "Name of the policies created"
  value       = module.iam_group_mutiple.policy_names
}