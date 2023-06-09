## Introduction

This module provides the template that can be used to provision FSx for Windows. The module has included all the possible parameters for the creation of the same .


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fsx_windows_file_system"></a> [fsx\_windows\_file\_system](#module\_fsx\_windows\_file\_system) | ../../../Modules/Storage and Data Management/FSx Windows | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_fsx_windows_file_system.fsx_test](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/fsx_windows_file_system) | resource |
| [aws_secretsmanager_secret.cred](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_group"></a> [administrator\_group](#input\_administrator\_group) | The name of the domain group whose members are granted administrative privileges for the file system | `string` | `null` | no |
| <a name="input_aliases"></a> [aliases](#input\_aliases) | DNS alias names that wants to associate with the Amazon FSx file system | `list(any)` | `null` | no |
| <a name="input_audit_log_destination"></a> [audit\_log\_destination](#input\_audit\_log\_destination) | The Amazon Resource Name (ARN) for the destination of the audit logs. | `string` | `null` | no |
| <a name="input_backup_days"></a> [backup\_days](#input\_backup\_days) | The number of days to retain automatic backups. Minimum of 0 and maximum of 90. Defaults to 7. Set to 0 to disable. | `number` | `0` | no |
| <a name="input_backup_id"></a> [backup\_id](#input\_backup\_id) | The ID of the source backup to create the filesystem from. | `string` | `null` | no |
| <a name="input_capacity"></a> [capacity](#input\_capacity) | Storage capacity for the FSx Windows | `number` | `200` | no |
| <a name="input_copy_tags_to_backups"></a> [copy\_tags\_to\_backups](#input\_copy\_tags\_to\_backups) | A boolean flag indicating whether tags on the file system should be copied to backups | `bool` | `false` | no |
| <a name="input_daily_automatic_backup_start_time"></a> [daily\_automatic\_backup\_start\_time](#input\_daily\_automatic\_backup\_start\_time) | The preferred time (in HH:MM format) to take daily automatic backups, in the UTC time zone. | `string` | `null` | no |
| <a name="input_deployment_type"></a> [deployment\_type](#input\_deployment\_type) | Specify the file system deployment type, valid values are MULTI\_AZ\_1, SINGLE\_AZ\_1 and SINGLE\_AZ\_2. Default value is SINGLE\_AZ\_1. | `string` | n/a | yes |
| <a name="input_directory_id"></a> [directory\_id](#input\_directory\_id) | Active Directory ID | `string` | n/a | yes |
| <a name="input_dns_ips"></a> [dns\_ips](#input\_dns\_ips) | A list of up to two IP addresses of DNS servers or domain controllers in the self-managed AD directory | `list(string)` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The fully qualified domain name of the self-managed AD directory | `string` | n/a | yes |
| <a name="input_file_access_audit_log_level"></a> [file\_access\_audit\_log\_level](#input\_file\_access\_audit\_log\_level) | Sets which attempt type is logged by Amazon FSx for file and folder accesses. | `string` | `"DISABLED"` | no |
| <a name="input_file_share_access_audit_log_level"></a> [file\_share\_access\_audit\_log\_level](#input\_file\_share\_access\_audit\_log\_level) | Sets which attempt type is logged by Amazon FSx for file share accesses | `string` | `"DISABLED"` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | KMS Key Id for FSx | `string` | `null` | no |
| <a name="input_organizational_unit_name"></a> [organizational\_unit\_name](#input\_organizational\_unit\_name) | he fully qualified distinguished name of the organizational unit within your self-managed AD directory that the Windows File Server instance will join. | `string` | `null` | no |
| <a name="input_preferred_subnet_id"></a> [preferred\_subnet\_id](#input\_preferred\_subnet\_id) | Specifiy the subnet in which you want the preferred file server to be located. Required for when deployment type is MULTI\_AZ\_1. | `string` | `null` | no |
| <a name="input_secretname"></a> [secretname](#input\_secretname) | Provide the name of the secret in your AWS Secrets manaer that holds the password for your Self managed directory | `string` | `null` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | A list of IDs for the security groups that apply to the specified network interfaces created for file system access | `list(string)` | `[]` | no |
| <a name="input_skip_final_backup"></a> [skip\_final\_backup](#input\_skip\_final\_backup) | When enabled, will skip the default final backup taken when the file system is deleted. | `bool` | `false` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | The storage type for the Fsx | `string` | `"SSD"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet IDs the file system will be accessible from. | `list(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for FSx Windows | `map(any)` | n/a | yes |
| <a name="input_throughput_capacity"></a> [throughput\_capacity](#input\_throughput\_capacity) | Throughput Capacity for the FSx Windows | `number` | `1024` | no |
| <a name="input_username"></a> [username](#input\_username) | The user name for the service account on your self-managed AD domain | `string` | n/a | yes |
| <a name="input_weekly_maintenance_start_time"></a> [weekly\_maintenance\_start\_time](#input\_weekly\_maintenance\_start\_time) | The preferred start time (in d:HH:MM format) to perform weekly maintenance, in the UTC time zone. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fsx_arn"></a> [fsx\_arn](#output\_fsx\_arn) | File system ARN |
| <a name="output_fsx_dns_name"></a> [fsx\_dns\_name](#output\_fsx\_dns\_name) | DNS name of the file system |
| <a name="output_fsx_id"></a> [fsx\_id](#output\_fsx\_id) | Identifier of the file system |
| <a name="output_fsx_network_ids"></a> [fsx\_network\_ids](#output\_fsx\_network\_ids) | Set of Elastic Network Interface identifiers from which the file system is accessible. |
| <a name="output_fsx_owner_id"></a> [fsx\_owner\_id](#output\_fsx\_owner\_id) | AWS account identifier that created the file system |
| <a name="output_fsx_preferred_server_ip"></a> [fsx\_preferred\_server\_ip](#output\_fsx\_preferred\_server\_ip) | The IP address of the primary, or preferred, file server. |
| <a name="output_fsx_remote_endpoint"></a> [fsx\_remote\_endpoint](#output\_fsx\_remote\_endpoint) | For MULTI\_AZ\_1 deployment types, use this endpoint when performing administrative tasks on the file system |
| <a name="output_fsx_tags"></a> [fsx\_tags](#output\_fsx\_tags) | A map of all the tags of the file system |
| <a name="output_fsx_vpc_id"></a> [fsx\_vpc\_id](#output\_fsx\_vpc\_id) | Identifier of the Virtual Private Cloud for the file system |
