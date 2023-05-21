#aws elastic beanstalk app name
output "app_name" {
  value       = module.elastic_beanstalk.app_name
  description = "aws elastic beanstalk app name"
}

# Elastic Beanstalk ID
output "app_id" {
  value       = module.elastic_beanstalk.app_id
  description = "Elastic Beanstalk ID"
}

#elastic beanstalk application version name
output "app_version_name" {
  value       = module.elastic_beanstalk.app_version_name
  description = "elastic beanstalk application version name"
}

#elastic beanstalk application version key
output "aws_elastic_beanstalk_env_id" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_id
  description = "ID of the Elastic Beanstalk Environment"
}

output "aws_elastic_beanstalk_env_name" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_name
  description = "Name of the Elastic Beanstalk Environment"
}

output "aws_elastic_beanstalk_env_tier" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_tier
  description = "The environment tier specified"
}

output "aws_elastic_beanstalk_env_application" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_application
  description = "The Elastic Beanstalk Application specified for this environment"
}

output "aws_elastic_beanstalk_env_cname" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_cname
  description = "Fully qualified DNS name for this Environment"
}

output "aws_elastic_beanstalk_env_instance" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_instance
  description = "Instances used by this Environment"
}

output "aws_elastic_beanstalk_env_autoscaling" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_autoscaling
  description = "The autoscaling groups used by this Environment"
}

output "aws_elastic_beanstalk_env_load_balancer" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_load_balancer
  description = "Elastic load balancers in use by this Environmen"
}

output "aws_elastic_beanstalk_env_sqs_queues" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_sqs_queues
  description = "SQS queues in use by this Environment"
}

output "aws_elastic_beanstalk_env_endpoint_url" {
  value       = module.elastic_beanstalk.aws_elastic_beanstalk_env_endpoint_url
  description = "The URL to the Load Balancer for this Environment"
}

