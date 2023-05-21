output "main_address" {
    value       = module.create_rds.main_address
    description = "The hostname of the main RDS instance"
}

output "main_arn" {
    value       = module.create_rds.main_arn
    description = "The ARN of the main RDS instance"
}

output "main_availability_zone" {
    value       = module.create_rds.main_availability_zone
    description = "The availability zone of the main instance"
}

output "main_endpoint" {
    value       = module.create_rds.main_endpoint
    description = "The connection endpoint in address:port format"
}

output "main_hosted_zone_id" {
    value       = module.create_rds.main_hosted_zone_id
    description = "The canonical hosted zone ID of the main DB instance (to be used in a Route 53 Alias record)"
}

output "main_id" {
    value       = module.create_rds.main_id
    description = "The RDS main instance ID"
}

output "main_resource_id" {
    value       = module.create_rds.main_resource_id
    description = "The RDS Resource ID of main instance"
}

output "replica_address" {
    value       = module.create_rds.replica_address
    description = "The hostname of the replica RDS instance"
}

output "replica_arn" {
    value       = module.create_rds.replica_arn
    description = "The ARN of the replica RDS instance"
}

output "replica_availability_zone" {
    value       = module.create_rds.replica_availability_zone
    description = "The availability zone of the replica instance"
}

output "replica_endpoint" {
    value       = module.create_rds.replica_endpoint
    description = "The connection endpoint in address:port format"
}

output "replica_hosted_zone_id" {
    value       = module.create_rds.replica_hosted_zone_id
    description = "The canonical hosted zone ID of the replica DB instance (to be used in a Route 53 Alias record)"
}

output "replica_id" {
    value       = module.create_rds.replica_id
    description = "The RDS replica instance ID"
}

output "replica_resource_id" {
    value       = module.create_rds.replica_resource_id
    description = "The RDS Resource ID of replica instance"
}

output "cross_region_replica_arn" {
    value       = module.create_rds.cross_region_replica_arn 
    description = "The ARN of the cross region replica"
}
