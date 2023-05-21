resource "aws_fsx_windows_file_system" "fsx_test" {

  active_directory_id               = var.directory_id
  kms_key_id                        = var.kms_key_id
  storage_capacity                  = var.capacity
  subnet_ids                        = var.subnet_id
  throughput_capacity               = var.throughput_capacity
  backup_id                         = var.backup_id
  aliases                           = var.aliases
  automatic_backup_retention_days   = var.backup_days
  copy_tags_to_backups              = var.copy_tags_to_backups
  daily_automatic_backup_start_time = var.daily_automatic_backup_start_time
  security_group_ids                = var.security_group_ids
  skip_final_backup                 = var.skip_final_backup
  weekly_maintenance_start_time     = var.weekly_maintenance_start_time
  storage_type                      = var.storage_type
  tags                              = var.tags
  deployment_type                   = var.deployment_type
  preferred_subnet_id               = var.deployment_type == "MULTI_AZ_1" ? var.preferred_subnet_id : null


  dynamic "audit_log_configuration" {
    for_each = var.audit_log_destination == null ? [] : [var.audit_log_destination]
    content {
      audit_log_destination             = var.audit_log_destination
      file_access_audit_log_level       = var.file_access_audit_log_level
      file_share_access_audit_log_level = var.file_share_access_audit_log_level
    }
  }

  dynamic "self_managed_active_directory" {
    for_each = var.directory_id == null ? [var.domain_name] : []
    content {
      dns_ips                                = var.dns_ips
      domain_name                            = var.domain_name
      password                               = data.aws_secretsmanager_secret_version.password.secret_string
      username                               = var.username
      file_system_administrators_group       = var.administrator_group
      organizational_unit_distinguished_name = var.organizational_unit_name
    }

  }

  lifecycle {
    precondition {
      condition     = contains(local.file_access, var.file_share_access_audit_log_level)
      error_message = "Permitted values are SUCCESS_ONLY, FAILURE_ONLY, SUCCESS_AND_FAILURE, and DISABLED. Default value is DISABLED."
    }
    precondition {
      condition     = contains(local.deployment, var.deployment_type)
      error_message = "Permitted values are MULTI_AZ_1, SINGLE_AZ_1,SINGLE_AZ_2"
    }
    precondition {
      condition     = var.deployment_type == var.storage_type == "HDD" ? local.deployment[0] || local.deployment[2] : var.storage_type == "SSD"
      error_message = "HDD storage type needs the deployment to be either in Single_AZ_2 or Multi_AZ_1"
    }

  }
}
locals {
  file_access = ["SUCCESS_ONLY", "FAILURE_ONLY", "SUCCESS_AND_FAILURE", "DISABLED"]
  deployment  = ["MULTI_AZ_1", "SINGLE_AZ_1", "SINGLE_AZ_2"]
}
