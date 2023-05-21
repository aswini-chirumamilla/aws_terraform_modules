resource "aws_ebs_volume" "ebs_volumes" {
  count                = length(var.ebs_volumes)
  availability_zone    = var.ebs_volumes[count.index].availability_zone
  size                 = var.ebs_volumes[count.index].size
  type                 = var.ebs_volumes[count.index].type
  tags                 = var.ebs_volumes[count.index].tag
  final_snapshot       = var.ebs_volumes[count.index].final_snapshot
  iops                 = var.ebs_volumes[count.index].type == "io1" || var.ebs_volumes[count.index].type == "io2" || var.ebs_volumes[count.index].type == "gp3" ? var.ebs_volumes[count.index].iops : null
  multi_attach_enabled = var.ebs_volumes[count.index].type == "io1" || var.ebs_volumes[count.index].type == "io2" ? var.ebs_volumes[count.index].multi_attach_enabled : false
  snapshot_id          = var.ebs_volumes[count.index].snapshot_id
  encrypted            = var.ebs_volumes[count.index].encrypted
  kms_key_id           = var.ebs_volumes[count.index].kms_key_id
  throughput           = var.ebs_volumes[count.index].type == "gp3" ? var.ebs_volumes[count.index].throughput : null
}
resource "aws_ebs_snapshot" "ebs_snapshot" {
  count                  = var.create_ebs_snapshot == true ? length(var.ebs_volumes) : 0
  volume_id              = "${aws_ebs_volume.ebs_volumes[count.index]}".id
  description            = var.ebs_snapshot[count.index].description
  outpost_arn            = var.ebs_snapshot[count.index].outpost_arn
  storage_tier           = var.ebs_snapshot[count.index].storage_tier
  permanent_restore      = var.ebs_snapshot[count.index].permanent_restore
  temporary_restore_days = var.ebs_snapshot[count.index].temporary_restore_days
  tags                   = var.ebs_snapshot[count.index].tags
}