## Prerequisites

1. For Encryption, provide the KMS keys as inputs. Else default keys will be created by AWS.


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |


## Resources

| Name | Type |
|------|------|
| [aws_appautoscaling_policy.index_read_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.index_write_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.table_read_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.table_write_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.index_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_appautoscaling_target.index_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_appautoscaling_target.table_read](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_appautoscaling_target.table_write](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/appautoscaling_target) | resource |
| [aws_dynamodb_table.dynamodb_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_dynamodb_table.dynamodb_table_autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_attributes"></a> [attributes](#input\_attributes) | Attributes required for partition key and range key. Each attribute should have a name and type. Attribute types must be a scalar type such as (S)tring, (N)umber or (B)inary | `list(map(string))` | `[]` | no |
| <a name="input_autoscaling_defaults"></a> [autoscaling\_defaults](#input\_autoscaling\_defaults) | A map of default autoscaling settings | `map(string)` | <pre>{<br>  "scale_in_cooldown": 0,<br>  "scale_out_cooldown": 0,<br>  "target_value": 70<br>}</pre> | no |
| <a name="input_autoscaling_enabled"></a> [autoscaling\_enabled](#input\_autoscaling\_enabled) | Autoscaling flag | `bool` | `false` | no |
| <a name="input_autoscaling_indexes"></a> [autoscaling\_indexes](#input\_autoscaling\_indexes) | A map of index autoscaling configurations. | `map(map(string))` | `{}` | no |
| <a name="input_autoscaling_read"></a> [autoscaling\_read](#input\_autoscaling\_read) | A map of read autoscaling settings. `max_capacity` is the only required key. | `map(string)` | `{}` | no |
| <a name="input_autoscaling_write"></a> [autoscaling\_write](#input\_autoscaling\_write) | A map of write autoscaling settings. `max_capacity` is the only required key. | `map(string)` | `{}` | no |
| <a name="input_capacity_mode"></a> [capacity\_mode](#input\_capacity\_mode) | Manage the Read/Write Throughput. Has an impact on the Billing. Valid values are PROVISIONED AND PAY\_PER\_REQUES | `string` | `"PROVISIONED"` | no |
| <a name="input_global_secondary_indexes"></a> [global\_secondary\_indexes](#input\_global\_secondary\_indexes) | Describe a GSI for the table. | `any` | `[]` | no |
| <a name="input_local_secondary_indexes"></a> [local\_secondary\_indexes](#input\_local\_secondary\_indexes) | Describe an LSI on the table. | `any` | `[]` | no |
| <a name="input_partition_key"></a> [partition\_key](#input\_partition\_key) | Partition key for the table. Should also be defined  as key value pair in the atrributes variable as key value pair | `string` | n/a | yes |
| <a name="input_point_in_time_recovery_enabled"></a> [point\_in\_time\_recovery\_enabled](#input\_point\_in\_time\_recovery\_enabled) | Flag to enable point-in-time recovery | `bool` | `true` | no |
| <a name="input_read_capacity"></a> [read\_capacity](#input\_read\_capacity) | The number of read units for the table defined. Measured in RCU. If the billing\_mode is PROVISIONED, this field should be greater than 0 | `number` | `5` | no |
| <a name="input_replica_regions"></a> [replica\_regions](#input\_replica\_regions) | Regions in which replicas needs to be created. | `any` | `[]` | no |
| <a name="input_server_side_encryption_enabled"></a> [server\_side\_encryption\_enabled](#input\_server\_side\_encryption\_enabled) | Whether or not to enable encryption at rest using an AWS managed KMS customer master key (CMK) | `bool` | `true` | no |
| <a name="input_server_side_encryption_kms_key_arn"></a> [server\_side\_encryption\_kms\_key\_arn](#input\_server\_side\_encryption\_kms\_key\_arn) | The ARN of the CMK that should be used for the AWS KMS encryption. This attribute should only be specified if the key is different from the default DynamoDB CMK, alias/aws/dynamodb. | `string` | `null` | no |
| <a name="input_sort_key"></a> [sort\_key](#input\_sort\_key) | Sort key for the table. Should also be defined in the atrributes variable as key value pair | `string` | n/a | yes |
| <a name="input_stream_enabled_dynamodb"></a> [stream\_enabled\_dynamodb](#input\_stream\_enabled\_dynamodb) | Sets the streams to be enabled or disabled | `bool` | `false` | no |
| <a name="input_stream_view_type_dynamodb"></a> [stream\_view\_type\_dynamodb](#input\_stream\_view\_type\_dynamodb) | Sets the information that is written to the stream when table is modified( Options:KEYS\_ONLY, NEW\_IMAGE, OLD\_IMAGE, NEW\_AND\_OLD\_IMAGES) | `string` | `"NEW_AND_OLD_IMAGES"` | no |
| <a name="input_table_class"></a> [table\_class](#input\_table\_class) | The storage class of the table. Valid values are STANDARD and STANDARD\_INFREQUENT\_ACCESS | `string` | `null` | no |
| <a name="input_table_name"></a> [table\_name](#input\_table\_name) | Name of the DynamoDB Table | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be associated to the DynamoDB table | `map(string)` | <pre>{<br>  "CreatedBy": "Terraform",<br>  "Environment": "Testing",<br>  "name": "P03_Sachin",<br>  "owner": "",<br>  "pid": "P03",<br>  "prj-name": "AWS GDS CIL Team"<br>}</pre> | no |
| <a name="input_ttl_attribute_name"></a> [ttl\_attribute\_name](#input\_ttl\_attribute\_name) | The name of the table attribute to store the TTL timestamp in | `string` | `"TimeToExist"` | no |
| <a name="input_ttl_enabled"></a> [ttl\_enabled](#input\_ttl\_enabled) | Indicates whether ttl is enabled | `bool` | `false` | no |
| <a name="input_write_capacity"></a> [write\_capacity](#input\_write\_capacity) | The number of write units for the table defined. Measured in RCU. If the billing\_mode is PROVISIONED, this field should be greater than 0 | `number` | `5` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_table_arn"></a> [dynamodb\_table\_arn](#output\_dynamodb\_table\_arn) | arn of the dynamodb table |
| <a name="output_dynamodb_table_id"></a> [dynamodb\_table\_id](#output\_dynamodb\_table\_id) | id of the dynamodb table |
| <a name="output_dynamodb_table_stream_arn"></a> [dynamodb\_table\_stream\_arn](#output\_dynamodb\_table\_stream\_arn) | arn of the stream table |
| <a name="output_dynamodb_table_stream_label"></a> [dynamodb\_table\_stream\_label](#output\_dynamodb\_table\_stream\_label) | A timestamp, in ISO 8601 format of the stream table |


## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_create_dynamodb"></a> [create\_dynamodb](#module\_create\_dynamodb) | ../../DynamoDB | n/a |

``` 
module "create_dynamodb" {
    source = "../../../Modules/DynamoDB"

    table_name                              = "DB_1"
    capacity_mode                           = "PROVISIONED"
    attributes                              = [{name = "UserId"
                                                type = "S"},
                                                {name = "key2"
                                                type = "S"}]
    partition_key                           = "UserId"
    sort_key                                = "key2"
    read_capacity                           = 5
    write_capacity                          = 5
    point_in_time_recovery_enabled          = true
    global_secondary_indexes                = [{
                                                name                = "Key2Index"
                                                hash_key            = "UserId"
                                                range_key           = "key2"
                                                projection_type     = "INCLUDE"
                                                non_key_attributes  = ["id"]
                                                write_capacity      = 5
                                                read_capacity       = 5 }]    
    local_secondary_indexes                 = []

    ttl_attribute_name                      = "TimeToExist"
    ttl_enabled                             = false

    stream_enabled_dynamodb                 = false
    stream_view_type_dynamodb               = "NEW_AND_OLD_IMAGES"
    server_side_encryption_enabled          = true
    server_side_encryption_kms_key_arn      = "arn:aws:kms:us-west-2:239312700453:key/7ee6502a-1dd7-4ff1-beeb-e1962f3abfd8"
    autoscaling_enabled                     = false
    autoscaling_defaults                    = { scale_in_cooldown  = 0
                                                scale_out_cooldown = 0
                                                target_value       = 70 }
    autoscaling_read                        = { scale_in_cooldown  = 60
                                                scale_out_cooldown = 60
                                                target_value       = 30
                                                max_capacity       = 5 }
    autoscaling_write                       = { scale_in_cooldown  = 60
                                                scale_out_cooldown = 60
                                                target_value       = 30
                                                max_capacity       = 5 }
    autoscaling_indexes                     = { Key2Index = {
                                                read_max_capacity  = 30
                                                read_min_capacity  = 10
                                                write_max_capacity = 30
                                                write_min_capacity = 10 }}
    table_class                             = "STANDARD"
    tags                                    = { "CreatedBy"   = "Terraform"
                                                "Environment" = "Testing"
                                                "name"        = "P03_Sachin"
                                                "pid"         = "P03"
                                                "prj-name"    = "AWS GDS CIL Team"
                                                "owner"       = "xxx@xxx.com"}
    replica_regions                         = [{ region_name            = "ap-south-1"
                                                 kms_key_arn            = "arn:aws:kms:ap-south-1:239312700453:key/0d3f0046-542a-40bf-81b1-6d916adb3424"
                                                 propagate_tags         = true
                                                 point_in_time_recovery = true }]
                                                
}

```