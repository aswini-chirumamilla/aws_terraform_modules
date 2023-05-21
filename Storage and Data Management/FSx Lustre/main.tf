# Creating the file system

resource "aws_fsx_lustre_file_system" "fsx_filesystem" {
  import_path                       = var.s3_import_path
  storage_capacity                  = var.capacity
  security_group_ids                = var.security_group_ids
  subnet_ids                        = var.subnet_id
  file_system_type_version          = var.file_system_type_version
  data_compression_type             = var.data_compression_type
  storage_type                      = var.storage_type
  backup_id                         = var.backup_id
  deployment_type                   = var.deployment_type
  copy_tags_to_backups              = var.copy_tags_to_backups
  weekly_maintenance_start_time     = var.weekly_maintenance_start_time
  kms_key_id                        = var.kms_key_alias_name == null ? null : "${data.aws_kms_key.kms_key_arn[0].arn}"
  per_unit_storage_throughput       = var.per_unit_storage_throughput
  automatic_backup_retention_days   = var.backup_days
  drive_cache_type                  = var.drive_cache_type
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  auto_import_policy                = var.auto_import_policy
  export_path                       = var.s3_export_path
  imported_file_chunk_size          = var.imported_file_chunk_size
  tags                              = var.tags

  dynamic "log_configuration" {
    for_each = var.log_configuration != null ? [1] : []
    content {
      destination = var.destination
      level       = var.level
    }
  }
}

locals {
  copy_tags_to_backups = (var.deployment_type == "PERSISTENT_1" || var.deployment_type == "PERSISTENT_2") ? var.copy_tags_to_backups : null
}