output "main_address" {
    value       = [aws_db_instance.main_instance.*.address]
    description = "The hostname of the main RDS instance"
}

output "main_arn" {
    value       = [aws_db_instance.main_instance.*.arn]
    description = "The ARN of the main RDS instance"
}

output "main_availability_zone" {
    value       = [aws_db_instance.main_instance.*.availability_zone]
    description = "The availability zone of the main instance"
}

output "main_endpoint" {
    value       = [aws_db_instance.main_instance.*.endpoint]
    description = "The connection endpoint in address:port format"
}

output "main_hosted_zone_id" {
    value       = [aws_db_instance.main_instance.*.hosted_zone_id]
    description = "The canonical hosted zone ID of the main DB instance (to be used in a Route 53 Alias record)"
}

output "main_id" {
    value       = [aws_db_instance.main_instance.*.id]
    description = "The RDS main instance ID"
}

output "main_resource_id" {
    value       = [aws_db_instance.main_instance.*.resource_id]
    description = "The RDS Resource ID of main instance"
}

output "replica_address" {
    value       = [aws_db_instance.replica_instance.*.address]
    description = "The hostname of the replica RDS instance"
}

output "replica_arn" {
    value       = [aws_db_instance.replica_instance.*.arn]
    description = "The ARN of the replica RDS instance"
}

output "replica_availability_zone" {
    value       = [aws_db_instance.replica_instance.*.availability_zone]
    description = "The availability zone of the replica instance"
}

output "replica_endpoint" {
    value       = [aws_db_instance.replica_instance.*.endpoint]
    description = "The connection endpoint in address:port format"
}

output "replica_hosted_zone_id" {
    value       = [aws_db_instance.replica_instance.*.hosted_zone_id]
    description = "The canonical hosted zone ID of the replica DB instance (to be used in a Route 53 Alias record)"
}

output "replica_id" {
    value       = [aws_db_instance.replica_instance.*.id]
    description = "The RDS replica instance ID"
}

output "replica_resource_id" {
    value       = [aws_db_instance.replica_instance.*.resource_id]
    description = "The RDS Resource ID of replica instance"
}

output "cross_region_replica_arn" {
    value       = [aws_db_instance_automated_backups_replication.cross_region_replica.*.id] 
    description = "The ARN of the cross region replica"
}