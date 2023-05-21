data "aws_ssm_parameter" "rds_pwd" {
    name = var.parameter_name
}

locals {
    ### For db_parameter_group
    db_pg = (lookup(var.pg_main["main"],"name", null) != null && lookup(var.pg_replica["replica"], "name", null) != null) ? merge(var.pg_main, var.pg_replica) : lookup(var.pg_main["main"], "name") != null ? var.pg_main : lookup(var.pg_replica["replica"], "name") != null ? var.pg_replica : tomap({})

    ### For db_subnet_group
    db_sg = (lookup(var.sg_main["main"], "subnet_group_name", null) != null && lookup(var.sg_replica["replica"], "subnet_group_name", null) != null) ? merge(var.sg_main, var.sg_replica) : lookup(var.sg_main["main"], "subnet_group_name", null) != null ? var.sg_main : lookup(var.sg_replica["replica"], "subnet_group_name") != null ? var.sg_replica : tomap({})

    ### For Read replica
    is_read_replica         = length(var.identifier_replica) == 0 ? false : true
    backup_retention_period = local.is_read_replica ? 0 : var.backup_retention_period
    skip_final_snapshot     = local.is_read_replica ? true : var.skip_final_snapshot
    copy_tags_to_snapshot   = local.is_read_replica ? false : var.copy_tags_to_snapshot
}

#---------------------------RDS Components---------------------------#
### Creation of db parameter group objects
resource "aws_db_parameter_group" "db_parm_group" {
    for_each = local.db_pg

    name        =  lookup(each.value, "name", null)
    family      =  lookup(each.value, "family", null)
    tags        = var.tags

    dynamic "parameter" {
        for_each = lookup(each.value, "db_parameters", null)

        content {
            name    = parameter.value.name
            value   = parameter.value.value
        }
    }

    lifecycle{
        create_before_destroy = true
    } 
}

### creation of db subnet group objects
resource "aws_db_subnet_group" "db_subnet_group" {
    for_each = local.db_sg

    name        = lookup(each.value, "subnet_group_name", null)
    subnet_ids  = lookup(each.value, "subnet_ids", null)
    tags        = var.tags
}

#---------------------------RDS Instances---------------------------#
### Main RDS Instance creation
resource "aws_db_instance" "main_instance" {
    lifecycle {
        ignore_changes = [ password, snapshot_identifier, ]
    }

    allocated_storage               = var.allocated_storage
    max_allocated_storage           = var.max_allocated_storage
    storage_type                    = var.storage_type
    iops                            = var.iops
    storage_encrypted               = var.storage_encrypted
    kms_key_id                      = var.kms_key_id 

    db_name                         = var.db_name
    engine                          = var.engine
    engine_version                  = var.engine_version
    username                        = var.username
    password                        = data.aws_ssm_parameter.rds_pwd.value

    parameter_group_name            = lookup(var.pg_main["main"],"name", null) != null ? aws_db_parameter_group.db_parm_group["main"].name : null

    instance_class                  = var.instance_class
    port                            = var.port
    deletion_protection             = var.deletion_protection
    identifier                      = var.identifier_main

    db_subnet_group_name            = lookup(var.sg_main["main"], "subnet_group_name", null) != null ? aws_db_subnet_group.db_subnet_group["main"].id : null

    skip_final_snapshot             = var.skip_final_snapshot
    final_snapshot_identifier       = var.final_snapshot_identifier
    copy_tags_to_snapshot           = var.copy_tags_to_snapshot
    snapshot_identifier             = var.snapshot_identifier

    multi_az                        = var.multi_az
    publicly_accessible             = var.publicly_accessible

    allow_major_version_upgrade     = var.allow_major_version_upgrade
    auto_minor_version_upgrade      = var.auto_minor_version_upgrade
    apply_immediately               = var.apply_immediately
    maintenance_window              = var.maintenance_window

    backup_retention_period         = var.backup_retention_period
    backup_window                   = var.backup_window
    monitoring_interval             = var.monitoring_interval
    monitoring_role_arn             = var.monitoring_role_arn
    performance_insights_enabled    = var.performance_insights_enabled
    enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
    tags                            = var.tags 
}

### Replica of the main RDS Instance 
resource "aws_db_instance" "replica_instance" {
    lifecycle {
        ignore_changes = [ snapshot_identifier, ]
    }

    count = length(var.identifier_replica) != 0 ? length(var.identifier_replica) : 0

    replicate_source_db             = "${aws_db_instance.main_instance.id}"
    storage_type                    = var.storage_type
    iops                            = var.iops
    storage_encrypted               = var.storage_encrypted
    kms_key_id                      = var.kms_key_id 

    parameter_group_name            = lookup(var.pg_replica["replica"], "name", null) != null ? aws_db_parameter_group.db_parm_group["replica"].name : (lookup(var.pg_main["main"], "name", null) != null ? aws_db_parameter_group.db_parm_group["main"].name : null)

    instance_class                  = var.instance_class
    port                            = var.port
    deletion_protection             = var.deletion_protection
    identifier                      = var.identifier_replica[count.index]

    db_subnet_group_name            = lookup(var.sg_replica["replica"], "subnet_group_name", null) != null ? aws_db_subnet_group.db_subnet_group["replica"].id : null

    skip_final_snapshot             = local.skip_final_snapshot
    final_snapshot_identifier       = var.final_snapshot_identifier
    copy_tags_to_snapshot           = local.copy_tags_to_snapshot
    snapshot_identifier             = var.snapshot_identifier

    multi_az                        = var.multi_az
    publicly_accessible             = var.publicly_accessible

    allow_major_version_upgrade     = var.allow_major_version_upgrade
    auto_minor_version_upgrade      = var.auto_minor_version_upgrade
    apply_immediately               = var.apply_immediately
    maintenance_window              = var.maintenance_window

    backup_retention_period         = local.backup_retention_period
    backup_window                   = var.backup_window
    monitoring_interval             = var.monitoring_interval
    monitoring_role_arn             = var.monitoring_role_arn
    performance_insights_enabled    = var.performance_insights_enabled
    enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports
    tags                            = var.tags
}

### Backup Replication of the main RDS Instance in another AWS Region
resource "aws_db_instance_automated_backups_replication" "cross_region_replica" {

    count = var.cross_replication && !(var.engine == "mysql" || var.engine == "mariadb") ? 1 : 0
    source_db_instance_arn          = "${aws_db_instance.main_instance.arn}"
    retention_period                = var.cross_region_backup_retention_period
    kms_key_id                      = var.cross_region_kms_key_id

    provider = aws.cross-replicate
}
