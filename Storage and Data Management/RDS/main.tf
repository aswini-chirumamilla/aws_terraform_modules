module "create_rds" {
    source = "../../../Modules/Storage and Data Management/RDS"

    providers = {
        aws.cross-replicate = aws.cross-replicate
    }
    # ### parameter group for mysql
    # pg_main                               = {
    #                                             "family"    = "mysql5.7"
    #                                             "name"      = "rds-mysqlpg"
    #                                             "temp_key"  = "pg_main"
    #                                             "db_parameters" = [{
    #                                                                         "name"  = "character_set_server"
    #                                                                         "value" = "utf8"
    #                                                                     },
    #                                                                     {
    #                                                                         "name"  = "character_set_client"
    #                                                                         "value" = "utf8"
    #                                                                     }]
    #                                         }

    ### parameter group for postgres
    # pg_main                               = {"main" = {
    #                                             "family"    = "postgres13"
    #                                             "name"      = "rds-postgrespg-main"
    #                                             "temp_key"  = "pg_main"
    #                                             "db_parameters"  = [{
    #                                                                     "name"  = "log_connections"
    #                                                                     "value" = "1"
    #                                                                 }]
    #                                         }}

    # pg_replica                            = {"replica" = {
    #                                             "family"    = "postgres13"
    #                                             "name"      = "rds-postgrespg-replica"
    #                                             "temp_key"  = "pg_main"
    #                                             "db_parameters"  = [{
    #                                                                     "name"  = "log_connections"
    #                                                                     "value" = "1"
    #                                                                 }]
    #                                         }}

    # # use_pg_main                           = false 
    # sg_main                               = {"main" = {
    #                                             "subnet_group_name"     = "test-subnet-main"
    #                                             "subnet_ids"            = ["subnet-0860766f6f5764cfb", "subnet-0c44cc0354fb5380a"]
    #                                             "temp_key"              = "sg_main"
    #                                         }}

    allocated_storage                     = 10
    allow_major_version_upgrade           = false
    apply_immediately                     = true
    auto_minor_version_upgrade            = true
    availability_zone                     = ["us-west-2b", "us-west-2c"]
    backup_retention_period               = 2
    backup_window                         = "00:00-01:00"
    blue_green_update                     = false
    db_name                               = "test_db"
    # db_options                            = {}

    delete_automated_backups              = true
    deletion_protection                   = false

    # ### Values for mysql
    # enabled_cloudwatch_logs_exports       = ["error","slowquery"]
    # engine                                = "mysql"
    # engine_version                        = "5.7"

    ### Values for postgres
    enabled_cloudwatch_logs_exports       = ["postgresql","upgrade"]
    engine                                = "postgres"
    engine_version                        = "13.4"

    identifier_main                       = "test-main"
    identifier_prefix                     = "Terraform-RDS"
    instance_class                        = "db.t3.micro"
    maintenance_window                    = "sun:08:00-sun:12:00"
    max_allocated_storage                 = 25
    multi_az                              = false
    parameter_name                        = "db_user1"
    performance_insights_enabled          = false
    performance_insights_retention_period = 7

    port                                  = 3306
    publicly_accessible                   = false
    skip_final_snapshot                   = true
    final_snapshot_identifier             = "test-final-snapshot"
    storage_encrypted                     = true
    storage_type                          = "gp2"

    tags = {
        "CreatedBy": "Terraform",
        "Environment": "Testing",
        "name": "P03_Sachin",
        "owner": "",
        "pid": "P03",
        "prj-name": "AWS GDS CIL Team"
    }
    username                              = "user1"
    vpc_security_group_ids                = ["sg-0022e1a6614303a6a", "sg-0750fb0777cf9735b"]

    # create_replica_instance               = true
    identifier_replica                    = ["replica-1"]
    cross_replication                     = true
    cross_region_kms_key_id               = "arn:aws:kms:ap-south-1:239312700453:key/0d3f0046-542a-40bf-81b1-6d916adb3424"
    cross_region_backup_retention_period  = 10

}
