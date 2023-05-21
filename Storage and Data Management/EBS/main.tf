module "ebs_volume_and_snapshot" {
  source              = "../modules"
  create_ebs_snapshot = var.create_ebs_snapshot
  ebs_volumes         = var.ebs_volumes
  ebs_snapshot        = var.ebs_snapshot
}