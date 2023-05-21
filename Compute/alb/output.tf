output "alb_target_group_arn" {
  value       = module.application_load_balancer.alb_target_group_arn
  description = "ARN of the target group of ALB"
}

output "application_load_balancer_dns_name" {
  value       = module.application_load_balancer.application_load_balancer_dns_name
  description = "DNS name of the application load balancer"
}

output "application_load_balancer_zone_id" {
  value       = module.application_load_balancer.application_load_balancer_zone_id
  description = "zone ID of application load balancer"
}