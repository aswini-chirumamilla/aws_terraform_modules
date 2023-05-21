<!-- BEGIN_TF_DOCS -->

###### Last Updated[DD/MM/YYYY]: 08/02/2023

## Introduction

Amazon Athena is an interactive query service that makes it easy to analyse data in Amazon S3 and other federated data sources using standard SQL.
Amazon Athena is the master module consisting of the athena database, athena workgroup and athena named query module.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Resources

| Name                                                                                                                                 | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [aws_athena_database.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_database)          | resource |
| [aws_athena_named_query.named_query](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_named_query) | resource |
| [aws_athena_workgroup.workgroup](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/athena_workgroup)       | resource |

## Inputs

| Name                                                                                    | Description                                                               | Type                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Default | Required |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | :------: |
| <a name="input_athena_database"></a> [athena_database](#input_athena_database)          | The variable is used to hold the configuration for the athena database.   | <pre>map(object({<br> bucket = string,<br> acl_configuration = optional(list(object({<br> s3_acl_option = string<br> }))),<br> comment = optional(string),<br> encryption_configuration = optional(list(object({<br> encryption_option = string,<br> kms_key = optional(string)<br> }))),<br> expected_bucket_owner = optional(string),<br> force_destroy = optional(bool),<br> properties = optional(map(string))<br> }))</pre>                                                                                                                                                                                                                                                                                                                                                                                                             | n/a     |   yes    |
| <a name="input_athena_named_query"></a> [athena_named_query](#input_athena_named_query) | The variable is used to hold the configuration for the athena named query | <pre>map(object({<br> name = string,<br> workgroup = optional(string),<br> database = string,<br> query = string,<br> description = optional(string)<br> }))</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | n/a     |   yes    |
| <a name="input_athena_workgroup"></a> [athena_workgroup](#input_athena_workgroup)       | The variable is used to hold the configuration for the athena workgroup   | <pre>map(object({<br> name = string,<br> configuration = optional(list(object({<br> bytes_scanned_cutoff_per_query = optional(number),<br> enforce_workgroup_configuration = optional(bool),<br> engine_version = optional(list(object({<br> selected_engine_version = optional(string)<br> }))),<br> execution_role = optional(string),<br> publish_cloudwatch_metrics_enabled = optional(bool),<br> result_configuration = optional(list(object({<br> encryption_configuration = optional(list(object({<br> encryption_option = string,<br> kms_key_arn = optional(string)<br> }))),<br> acl_configuration = optional(list(object({<br> s3_acl_option = string<br> }))),<br> expected_bucket_owner = optional(string),<br> output_location = optional(string)<br> }))),<br> requester_pays_enabled = optional(bool)<br> })))<br> }))</pre> | n/a     |   yes    |

## Outputs

| Name                                                                                         | Description               |
| -------------------------------------------------------------------------------------------- | ------------------------- |
| <a name="output_athena_database_id"></a> [athena_database_id](#output_athena_database_id)    | The name of the database  |
| <a name="output_athena_named_query"></a> [athena_named_query](#output_athena_named_query)    | Unique id of the queries  |
| <a name="output_athena_workgroup_id"></a> [athena_workgroup_id](#output_athena_workgroup_id) | The name of the workgroup |

## Module Usage

module "athena" {
source = "../../modules/module_athena"
athena_database = var.athena_database
athena_workgroup = var.athena_workgroup
athena_named_query = var.athena_named_query
}

<!-- END_TF_DOCS -->
