output "aws_instance_arn" {
  value       = aws_instance.ec2_instance.arn
  description = "ARN of the instance"
}

output "aws_instance_state" {
  value       = aws_instance.ec2_instance.instance_state
  description = "State of the instance. One of: pending, running, shutting-down, terminated, stopping, stopped"
}

output "aws_instance_outpost_arn" {
  value       = try(aws_instance.ec2_instance.outpost_arn, "")
  description = "ARN of the Outpost the instance is assigned to."
}

output "aws_instance_private_dns" {
  value       = try(aws_instance.ec2_instance.private_dns, "")
  description = "Private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
}

output "ec2_vpc_id" {
  value       = data.aws_subnet.subnet_ec2.vpc_id
  description = "vpc id of the subnet associated with ec2"
}

output "ec2_primary_network_interface_id" {
  value       = aws_instance.ec2_instance.primary_network_interface_id
  description = "ID of the instance's primary network interface"
}