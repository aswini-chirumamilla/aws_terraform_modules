output "ebs_volume_arn" {
  value       = module.ebs_volume_and_snapshot.ebs_volume_arn
  description = "ARNs of ebs volumes"
}
output "ebs_snapshot_arn" {
  value       = module.ebs_volume_and_snapshot.ebs_snapshot_arn
  description = "ARNs of ebs snapshots"
}