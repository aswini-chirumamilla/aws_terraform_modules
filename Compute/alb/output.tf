output "alb_target_group_arn" {
  value       = aws_lb.application_load_balancer.arn
  description = "ARN of the target group of ALB"
}

output "application_load_balancer_dns_name" {
  value       = aws_lb.application_load_balancer.dns_name
  description = "DNS name of the application load balancer"
}

output "application_load_balancer_zone_id" {
  value       = aws_lb.application_load_balancer.zone_id
  description = "zone ID of application load balancer"
}
