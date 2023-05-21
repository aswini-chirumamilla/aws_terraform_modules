#-------------------------------------------Input values related to Provider-------------------------------------------------------#
aws_region = "us-west-2"
aws_profile = "Terraform-user"


#--------------------------------------Input values related to EBS Volume resource-------------------------------------------------#

ebs_volumes = [{
  availability_zone    = "us-west-2a"
  encrypted            = true
  final_snapshot       = true
  iops                 = 300
  kms_key_id           = "arn:aws:kms:us-west-2:239312700453:key/fb6d4575-c173-4bb9-be40-524285cc65a6"
  multi_attach_enabled = true
  size                 = 40
  snapshot_id          = "snap-0fe13540bbb0d8041"
  tag = {
    Name     = "Develop"
    "Backup" = "true"
  }
  throughput = 150
  type       = "io1"
  },
  {
    availability_zone    = "us-west-2a"
    encrypted            = true
    final_snapshot       = true
    iops                 = 300
    kms_key_id           = "arn:aws:kms:us-west-2:239312700453:key/fb6d4575-c173-4bb9-be40-524285cc65a6"
    multi_attach_enabled = false
    size                 = 40
    snapshot_id          = "snap-0fe13540bbb0d8041"
    tag = {
      Name     = "Develop"
      "Backup" = "true"
    }
    throughput = 150
    type       = "gp3"
}]

#--------------------------------------Input values related to EBS Snapshot resource-------------------------------------------------#

create_ebs_snapshot = true

ebs_snapshot = [{
  description = "Demo Snapshot"
  //outpost_arn = "arn:aws:outposts:us-west-2:239312700453:outpost/op-0cf0c39a6ad19dc24"
  permanent_restore = false
  storage_tier      = "standard"
  tags = {
    name     = "Develop-snap"
    "Backup" = "true"
  }
  temporary_restore_days = 1
  },
  {
    description = "Demo Snapshot"
    // outpost_arn       = "arn:aws:outposts:us-west-2:239312700453:outpost/op-0cf0c39a6ad19dc24"
    permanent_restore = false
    storage_tier      = "standard"
    tags = {
      name     = "Develop-snap"
      "Backup" = "true"
    }
    temporary_restore_days = 1
}]