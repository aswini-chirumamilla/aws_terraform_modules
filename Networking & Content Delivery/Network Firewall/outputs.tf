# AWS Network Firewall ARN
output "network_firewall_arn" {
  description = "AWS Network Firewall ARN"
  value       = module.network_firewall.network_firewall_arn

}