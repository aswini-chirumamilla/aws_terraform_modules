output "ebs_volume_arn" {
  description = "ARN of the created ebs module"
  value       = aws_ebs_volume.ebs_volumes[*].arn
}
output "ebs_snapshot_arn" {
  description = "ARN of the created ebs snapshot"
  value       = aws_ebs_snapshot.ebs_snapshot[*].arn
}