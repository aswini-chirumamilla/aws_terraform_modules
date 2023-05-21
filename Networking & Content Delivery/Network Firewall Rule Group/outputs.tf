# AWS Network Firewall Rule Group ARN
output "network_firewall_rule_group_arn" {
  description = "AWS Network Firewall Rule Group ARN"
  value       = aws_networkfirewall_rule_group.network_firewall_rule_group.arn

}