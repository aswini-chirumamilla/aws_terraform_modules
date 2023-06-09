## Description

Terraform module to create FSx Lustre.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.49 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.49.0 |

## Resources

| Name | Type |
|------|------|
| [aws_fsx_lustre_file_system](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/fsx_lustre_file_system) | resource |
| [aws_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_import_policy"></a> [auto\_import\_policy](#input\_auto\_import\_policy) | The auto import policy for FSx. | `string` | n/a | yes |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | Name of the profile | `string` | `"terraform"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Name of the region | `string` | `"us-east-1"` | no |
| <a name="input_backup_days"></a> [backup\_days](#input\_backup\_days) | The back retention days. | `number` | `0` | no |
| <a name="input_backup_id"></a> [backup\_id](#input\_backup\_id) | The ID of the source backup to create the filesystem from. | `string` | `null` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | fsx lustre file system capacity | `number` | n/a | yes |
| <a name="input_copy_tags_to_backups"></a> [copy\_tags\_to\_backups](#input\_copy\_tags\_to\_backups) | Copying tags to backups | `bool` | n/a | yes |
| <a name="input_daily_automatic_backup_start_time"></a> [daily\_automatic\_backup\_start\_time](#input\_daily\_automatic\_backup\_start\_time) | The preferred time (in HH:MM format) to take daily automatic backups, in the UTC time zone. | `string` | `null` | no |
| <a name="input_data_compression_type"></a> [data\_compression\_type](#input\_data\_compression\_type) | To Set the data compression configuration for the file system valid values are LZ4 and NONE,default is 'NONE' . | `string` | `"NONE"` | no |
| <a name="input_deployment_type"></a> [deployment\_type](#input\_deployment\_type) | The filesystem deployment type. One of: SCRATCH\_1, SCRATCH\_2, PERSISTENT\_1, PERSISTENT\_2. | `string` | n/a | yes |
| <a name="input_drive_cache_type"></a> [drive\_cache\_type](#input\_drive\_cache\_type) | The drive cache type. | `string` | `null` | no |
| <a name="input_file_system_type_version"></a> [file\_system\_type\_version](#input\_file\_system\_type\_version) | The Lustre version for the file system. | `number` | n/a | yes |
| <a name="input_imported_file_chunk_size"></a> [imported\_file\_chunk\_size](#input\_imported\_file\_chunk\_size) | The imported file chunk size for FSx. | `number` | n/a | yes |
| <a name="input_kms_key_alias_name"></a> [kms\_key\_alias\_name](#input\_kms\_key\_alias\_name) | Provide Alias name for Customer Managed KMS Key for FSx. Provide the null value for using the default AWS-managed KMS encryption. | `string` | `null` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The kms key id. | `string` | `null` | no |
| <a name="input_level"></a> [level](#input\_level) | Sets which data repository events are logged by Amazon FSx. | `string` | `"DISABLED"` | no |
| <a name="input_log_configuration"></a> [log\_configuration](#input\_log\_configuration) | The Lustre logging configuration used when creating an Amazon FSx for Lustre file system. | `string` | `null` | no |
| <a name="input_per_unit_storage_throughput"></a> [per\_unit\_storage\_throughput](#input\_per\_unit\_storage\_throughput) | The per unit strogare throughout for FSx lustre. | `number` | n/a | yes |
| <a name="input_s3_export_path"></a> [s3\_export\_path](#input\_s3\_export\_path) | The s3 export path for FSx. | `string` | n/a | yes |
| <a name="input_s3_import_path"></a> [s3\_import\_path](#input\_s3\_import\_path) | The s3 bucket to use to back your fsx filesystem. | `string` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of IDs for the security groups that apply to the specified network interfaces created for file system access | `list(string)` | `[]` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The filesystem storage type. Either SSD or HDD. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet to create the filesystem in | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for FSx Windows | `map(string)` | n/a | yes |
| <a name="input_weekly_maintenance_start_time"></a> [weekly\_maintenance\_start\_time](#input\_weekly\_maintenance\_start\_time) | The weekly maintenance start time. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_file_system_arn"></a> [file\_system\_arn](#output\_file\_system\_arn) | Amazon Resource Name of the file system |
| <a name="output_file_system_dns_name"></a> [file\_system\_dns\_name](#output\_file\_system\_dns\_name) | DNS name of the file system |
| <a name="output_file_system_id"></a> [file\_system\_id](#output\_file\_system\_id) | Identifier of the file system |
| <a name="output_file_system_mount_name"></a> [file\_system\_mount\_name](#output\_file\_system\_mount\_name) | The value to be used when mounting the filesystem. |
| <a name="output_file_system_network_ids"></a> [file\_system\_network\_ids](#output\_file\_system\_network\_ids) | Set of Elastic Network Interface identifiers from which the file system is accessible. |
| <a name="output_file_system_owner_id"></a> [file\_system\_owner\_id](#output\_file\_system\_owner\_id) | AWS account identifier that created the file system |
| <a name="output_file_system_security_group_ids"></a> [file\_system\_security\_group\_ids](#output\_file\_system\_security\_group\_ids) | The security groups that apply to the specified network interfaces created for file system access |
| <a name="output_file_system_subnet_id"></a> [file\_system\_subnet\_id](#output\_file\_system\_subnet\_id) | Identifier of the subnet for the file system. |
| <a name="output_file_system_tags"></a> [file\_system\_tags](#output\_file\_system\_tags) | A map of all the tags of the file system |
| <a name="output_file_system_vpc_id"></a> [file\_system\_vpc\_id](#output\_file\_system\_vpc\_id) | Identifier of the Virtual Private Cloud for the file system. |

## Modules

| Name                                                   | Source | Version |
|--------------------------------------------------------|--------|---------|
| <a name="module_FSx_Lustre"></a> [FSx_Lustre](#module\_FSx_Lustre) | ../../../../Modules/Storage and Data Management/FSx Lustre | n/a |


~~~
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