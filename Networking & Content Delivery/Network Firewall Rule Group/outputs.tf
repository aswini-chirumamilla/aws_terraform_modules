# AWS Network Firewall ARN
output "network_firewall_rule_group_arn" {
  description = "AWS Network Firewall Rule Group ARN"
  value       = module.network_firewall_rule_group.network_firewall_rule_group_arn

}