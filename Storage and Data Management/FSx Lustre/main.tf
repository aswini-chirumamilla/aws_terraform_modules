module "FSx_Lustre" {
  source                            = "../../../Modules/Storage and Data Management/FSx Lustre"
  capacity                          = var.capacity
  subnet_id                         = var.subnet_id
  per_unit_storage_throughput       = var.per_unit_storage_throughput
  s3_import_path                    = var.s3_import_path
  s3_export_path                    = var.s3_import_path
  level                             = var.level
  file_system_type_version          = var.file_system_type_version
  storage_type                      = var.storage_type
  deployment_type                   = var.deployment_type
  imported_file_chunk_size          = var.imported_file_chunk_size
  data_compression_type             = var.data_compression_type
  auto_import_policy                = var.auto_import_policy
  copy_tags_to_backups              = var.copy_tags_to_backups
  tags                              = var.tags
  security_group_ids                = var.security_group_ids
  weekly_maintenance_start_time     = var.weekly_maintenance_start_time
  backup_days                       = var.backup_days
  drive_cache_type                  = var.drive_cache_type
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  kms_key_alias_name                = var.kms_key_alias_name
}