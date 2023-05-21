# AWS Network Firewall
output "network_firewall_arn" {
  description = "AWS Network Firewall ARN"
  value       = aws_networkfirewall_firewall.network_firewall.arn

}