output "aws_instance_arn" {

  value = module.ec2.aws_instance_arn

}

output "aws_instance_state" {

  value       = module.ec2.aws_instance_state
  description = "State of the instance. One of: pending, running, shutting-down, terminated, stopping, stopped"

}

output "aws_instance_outpost_arn" {

  value       = module.ec2.aws_instance_outpost_arn
  description = "ARN of the Outpost the instance is assigned to."

}

output "aws_instance_private_dns" {

  value       = module.ec2.aws_instance_private_dns
  description = "Private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"

}

output "ec2_primary_network_interface_id" {
  value       = module.ec2.ec2_primary_network_interface_id
  description = "ID of the instance's primary network interface"
}