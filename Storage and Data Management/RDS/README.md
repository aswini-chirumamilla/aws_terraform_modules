## Description

This module will create RDS main instance, Replica instances (by providing the list of identifiers in identifier_replica variable) and cross region replication (by setting the cross_replication flag to true). Additionally it can also create database parameter groups for both main and replica instances and also create database subnet groups. For the DB Main instance it fetches the password from the Parameter Store.

## Prerequisites

1.  VPC should be available
2.  Subnets in the VPC should be in place
3.  Security Groups attached to the VPC should be in place 
4.  KMS keys should be in place for Cross Region Replication
5.  DB instance type, DB engine and engine version, Space required should be decided upon as these are mandatory fields
6.  DB Parameter Groups and DB Subnet Groups can created separately for main and replica instances, if required. However it should be ensured that the names field should be different for main and replica groups.
7.  A parameter in Parameter Store needs to be created for DB password.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.4 |
| <a name="provider_aws.cross-replicate"></a> [aws.cross-replicate](#provider\_aws.cross-replicate) | ~> 4.4 |


## Resources

| Name | Type |
|------|------|
| [aws_db_instance.main_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_instance.replica_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_instance_automated_backups_replication.cross_region_replica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance_automated_backups_replication) | resource |
| [aws_db_parameter_group.db_parm_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_ssm_parameter.rds_pwd](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | Allocated storage in GB. Not required snapshot\_identifier or replicate\_source\_db is provided | `number` | n/a | yes |
| <a name="input_allow_major_version_upgrade"></a> [allow\_major\_version\_upgrade](#input\_allow\_major\_version\_upgrade) | Indicates that major version upgrades are allowed. | `bool` | `false` | no |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any database modifications are applied immediately, or during the next maintenance window | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The AZ for the RDS instance | `list(string)` | `[]` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for. Must be between 0 and 35 | `number` | `7` | no |
| <a name="input_backup_window"></a> [backup\_window](#input\_backup\_window) | The daily time range (in UTC) during which automated backups are created if they are enabled. Must not overlap with maintenance\_window | `string` | `"00:00-01:00"` | no |
| <a name="input_blue_green_update"></a> [blue\_green\_update](#input\_blue\_green\_update) | Enables low-downtime updates using RDS Blue/Green deployments | `bool` | `false` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | The identifier of the CA certificate for the DB instance | `string` | `null` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | Copy all Instance tags to snapshots | `bool` | `false` | no |
| <a name="input_create_before_destroy"></a> [create\_before\_destroy](#input\_create\_before\_destroy) | lifecycle flag to check if the parameter group needs to be created before destroying the existing parameter group | `bool` | `true` | no |
| <a name="input_cross_region_backup_retention_period"></a> [cross\_region\_backup\_retention\_period](#input\_cross\_region\_backup\_retention\_period) | The days to retain backups for. Must be between 0 and 35 | `number` | `7` | no |
| <a name="input_cross_region_kms_key_id"></a> [cross\_region\_kms\_key\_id](#input\_cross\_region\_kms\_key\_id) | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN | `string` | `null` | no |
| <a name="input_cross_replication"></a> [cross\_replication](#input\_cross\_replication) | Flag to check for enabling the cross region replication | `bool` | `false` | no |
| <a name="input_custom_iam_instance_profile"></a> [custom\_iam\_instance\_profile](#input\_custom\_iam\_instance\_profile) | The instance profile associated with the underlying Amazon EC2 instance of an RDS Custom DB instance | `string` | `null` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance | `string` | `null` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | DB subnet group name | `string` | `null` | no |
| <a name="input_delete_automated_backups"></a> [delete\_automated\_backups](#input\_delete\_automated\_backups) | Specifies whether to remove automated backups immediately after the DB instance is deleted | `bool` | `false` | no |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | If the DB instance should have deletion protection enabled | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | Set of log types to enable for exporting to CloudWatch logs | `list(string)` | `[]` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The database engine to use. Not required if snapshot\_identifier or replicate\_source\_db is provided | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The engine version to use. If auto\_minor\_version\_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10) | `string` | n/a | yes |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | The name of your final DB snapshot when this DB instance is deleted. Must be provided if skip\_final\_snapshot is set to false | `string` | `null` | no |
| <a name="input_identifier_main"></a> [identifier\_main](#input\_identifier\_main) | The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier. Required if restore\_to\_point\_in\_time is specified. | `string` | `null` | no |
| <a name="input_identifier_prefix"></a> [identifier\_prefix](#input\_identifier\_prefix) | Creates a unique identifier beginning with the specified prefix. Conflicts with identifier | `string` | `"Terraform-RDS"` | no |
| <a name="input_identifier_replica"></a> [identifier\_replica](#input\_identifier\_replica) | The name of the RDS instance, if omitted, Terraform will assign a random, unique identifier | `list(string)` | `[]` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance type of the RDS instance | `string` | n/a | yes |
| <a name="input_iops"></a> [iops](#input\_iops) | The amount of provisioned IOPS. Setting this implies a storage\_type of 'io1' | `string` | `"0"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN | `string` | `null` | no |
| <a name="input_license_model"></a> [license\_model](#input\_license\_model) | License model information for the DB instance | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | The window to perform maintenance in | `string` | `"sun:08:00-sun:12:00"` | no |
| <a name="input_max_allocated_storage"></a> [max\_allocated\_storage](#input\_max\_allocated\_storage) | When configured, the upper limit to which Amazon RDS can automatically scale the storage of the DB instance. Configuring this will automatically ignore differences to allocated\_storage. Must be greater than or equal to allocated\_storage or 0 to disable Storage Autoscaling | `number` | `0` | no |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. Valid Values: 0, 1, 5, 10, 15, 30, 60 | `number` | `0` | no |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | The ARN for the IAM role that permits RDS to send enhanced monitoring metrics to CloudWatch Logs | `string` | `null` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Specifies if the RDS instance is multi-AZ | `bool` | `false` | no |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group\_name) | Reference to parameter group | `string` | `null` | no |
| <a name="input_parameter_name"></a> [parameter\_name](#input\_parameter\_name) | AWS SSM parameter name which contains the password | `string` | n/a | yes |
| <a name="input_performance_insights_enabled"></a> [performance\_insights\_enabled](#input\_performance\_insights\_enabled) | Specifies whether Performance Insights are enabled | `bool` | `false` | no |
| <a name="input_performance_insights_kms_key_id"></a> [performance\_insights\_kms\_key\_id](#input\_performance\_insights\_kms\_key\_id) | The ARN for the KMS key to encrypt Performance Insights data. Required if performance\_insights\_enabled is set to TRUE | `string` | `null` | no |
| <a name="input_performance_insights_retention_period"></a> [performance\_insights\_retention\_period](#input\_performance\_insights\_retention\_period) | Amount of time in days to retain Performance Insights data. Valid values are 7, 731 (2 years) or a multiple of 31. When specifying performance\_insights\_retention\_period, performance\_insights\_enabled needs to be set to true | `number` | `7` | no |
| <a name="input_pg_main"></a> [pg\_main](#input\_pg\_main) | Values of name and family are passed as objects | <pre>object({ main = optional (object({<br>                                family        = optional(string, null)<br>                                name          = optional(string, null)<br>                                db_parameters = optional(list(object(<br>                                { name = optional(string, null)<br>                                  value = optional(string, null)}<br>                                )), [{<br>                                        name  = null<br>                                        value = null<br>                                    }])<br>                             }),{})})</pre> | <pre>{<br>  "main": {<br>    "db_parameters": [<br>      {<br>        "name": null,<br>        "value": null<br>      }<br>    ],<br>    "family": null,<br>    "name": null<br>  }<br>}</pre> | no |
| <a name="input_pg_replica"></a> [pg\_replica](#input\_pg\_replica) | Values of name and family are passed as objects | <pre>object({ replica = optional (object({<br>                                family        = optional(string, null)<br>                                name          = optional(string, null)<br>                                db_parameters = optional(list(object(<br>                                { name = optional(string, null)<br>                                  value = optional(string, null)}<br>                                )), [{<br>                                        name  = null<br>                                        value = null<br>                                    }])<br>                             }),{})})</pre> | <pre>{<br>  "replica": {<br>    "db_parameters": [<br>      {<br>        "name": null,<br>        "value": null<br>      }<br>    ],<br>    "family": null,<br>    "name": null<br>  }<br>}</pre> | no |
| <a name="input_port"></a> [port](#input\_port) | The port on which the DB accepts connections | `number` | `null` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Flag to check if instance is publicly accessible | `bool` | `false` | no |
| <a name="input_replica_mode"></a> [replica\_mode](#input\_replica\_mode) | Specifies whether the replica is in either mounted or open-read-only mode. SUPPORTED BY ORACLE INSTANCES ONLY | `string` | `"open-read-only"` | no |
| <a name="input_replicate_source_db"></a> [replicate\_source\_db](#input\_replicate\_source\_db) | Specifies that this resource is a Replicate database, and to use this value as the source database | `string` | `null` | no |
| <a name="input_sg_main"></a> [sg\_main](#input\_sg\_main) | values to be passed for main subnet group creation | <pre>object({ main = optional(object({<br>                            subnet_group_name   = optional(string, null)<br>                            subnet_ids          = optional(list(string), null)<br>                        }))})</pre> | <pre>{<br>  "main": {<br>    "subnet_group_name": null,<br>    "subnet_ids": []<br>  }<br>}</pre> | no |
| <a name="input_sg_replica"></a> [sg\_replica](#input\_sg\_replica) | values to be passed for replica subnet group creation | <pre>object({ replica = optional(object({<br>                        subnet_group_name   = optional(string, null)<br>                        subnet_ids          = optional(list(string), null)<br>                    }))})</pre> | <pre>{<br>  "replica": {<br>    "subnet_group_name": null,<br>    "subnet_ids": []<br>  }<br>}</pre> | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB instance is deleted | `bool` | `false` | no |
| <a name="input_snapshot_identifier"></a> [snapshot\_identifier](#input\_snapshot\_identifier) | Specifies whether or not to create this database from a snapshot | `string` | `null` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB instance is encrypted | `bool` | `true` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | One of 'standard' (magnetic), 'gp2' (general purpose SSD), 'gp3' (general purpose SSD that needs iops independently) or 'io1' (provisioned IOPS SSD) | `string` | `"io1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be associated to the DynamoDB table | `map(string)` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Username for the master DB user. Cannot be specified for a replica. Not required if snapshot\_identifier or replicate\_source\_db is provided | `string` | `null` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of VPC security groups to associate | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cross_region_replica_arn"></a> [cross\_region\_replica\_arn](#output\_cross\_region\_replica\_arn) | The ARN of the cross region replica |
| <a name="output_main_address"></a> [main\_address](#output\_main\_address) | The hostname of the main RDS instance |
| <a name="output_main_arn"></a> [main\_arn](#output\_main\_arn) | The ARN of the main RDS instance |
| <a name="output_main_availability_zone"></a> [main\_availability\_zone](#output\_main\_availability\_zone) | The availability zone of the main instance |
| <a name="output_main_endpoint"></a> [main\_endpoint](#output\_main\_endpoint) | The connection endpoint in address:port format |
| <a name="output_main_hosted_zone_id"></a> [main\_hosted\_zone\_id](#output\_main\_hosted\_zone\_id) | The canonical hosted zone ID of the main DB instance (to be used in a Route 53 Alias record) |
| <a name="output_main_id"></a> [main\_id](#output\_main\_id) | The RDS main instance ID |
| <a name="output_main_resource_id"></a> [main\_resource\_id](#output\_main\_resource\_id) | The RDS Resource ID of main instance |
| <a name="output_replica_address"></a> [replica\_address](#output\_replica\_address) | The hostname of the replica RDS instance |
| <a name="output_replica_arn"></a> [replica\_arn](#output\_replica\_arn) | The ARN of the replica RDS instance |
| <a name="output_replica_availability_zone"></a> [replica\_availability\_zone](#output\_replica\_availability\_zone) | The availability zone of the replica instance |
| <a name="output_replica_endpoint"></a> [replica\_endpoint](#output\_replica\_endpoint) | The connection endpoint in address:port format |
| <a name="output_replica_hosted_zone_id"></a> [replica\_hosted\_zone\_id](#output\_replica\_hosted\_zone\_id) | The canonical hosted zone ID of the replica DB instance (to be used in a Route 53 Alias record) |
| <a name="output_replica_id"></a> [replica\_id](#output\_replica\_id) | The RDS replica instance ID |
| <a name="output_replica_resource_id"></a> [replica\_resource\_id](#output\_replica\_resource\_id) | The RDS Resource ID of replica instance |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_rds"></a> [create\_rds](#module\_create\_rds) | ../../../rds | n/a |

```
provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  region  = "ap-south-1"
  alias   = "cross-replicate"
}

module "create_rds" {
    source = "../RDS_Combined"

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

```