module "fsx_windows_file_system" {

  source                            = "../../../Modules/Storage and Data Management/FSx Windows"
  directory_id                      = var.directory_id
  kms_key_id                        = var.kms_key_id
  capacity                          = var.capacity
  subnet_id                         = var.subnet_id
  throughput_capacity               = var.throughput_capacity
  backup_id                         = var.backup_id
  aliases                           = var.aliases
  backup_days                       = var.backup_days
  copy_tags_to_backups              = var.copy_tags_to_backups
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  security_group_ids                = var.security_group_ids
  skip_final_backup                 = var.skip_final_backup
  weekly_maintenance_start_time     = var.weekly_maintenance_start_time
  storage_type                      = var.storage_type
  tags                              = var.tags
  deployment_type                   = var.deployment_type
  preferred_subnet_id               = var.deployment_type == "MULTI_AZ_1" ? var.preferred_subnet_id : null
  audit_log_destination             = var.audit_log_destination
  file_access_audit_log_level       = var.file_access_audit_log_level
  file_share_access_audit_log_level = var.file_share_access_audit_log_level
  dns_ips                           = var.dns_ips
  domain_name                       = var.domain_name
  username                          = var.username
  secretname                        = var.secretname
  administrator_group               = var.administrator_group
  organizational_unit_name          = var.organizational_unit_name
}

