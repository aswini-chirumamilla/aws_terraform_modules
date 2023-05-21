# AWS Network Firewall Policy Id
output "network_firewall_policy_arn" {
  description = "AWS Network Firewall Policy ARN"
  value       = module.network_firewall_policy.network_firewall_policy_arn

}