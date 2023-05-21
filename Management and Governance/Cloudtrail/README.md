<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 08/02/2023
## Introduction
CloudTrail, module helps to monitor the AWS deployments in the cloud by getting a history of AWS API calls for your account.

## File Structure
This particular module is having the following configuration files.
 
- main.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in main.tf
- output.tf : This file is having all the resource output details generated.

## Requirements

| Name | Version   |
|------|-----------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.48|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) |  4.54.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.new_trail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_cloudtrail_service_account.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/cloudtrail_service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_watch_logs_group_arn"></a> [cloud\_watch\_logs\_group\_arn](#input\_cloud\_watch\_logs\_group\_arn) | Specifies a log group name using an Amazon Resource Name (ARN), that represents the log group to which CloudTrail logs will be delivered | `string` | `""` | no |
| <a name="input_cloud_watch_logs_role_arn"></a> [cloud\_watch\_logs\_role\_arn](#input\_cloud\_watch\_logs\_role\_arn) | Specifies the role for the CloudWatch Logs endpoint to assume to write to a user’s log group | `string` | `""` | no |
| <a name="input_cloudtrail_bucket_name"></a> [cloudtrail\_bucket\_name](#input\_cloudtrail\_bucket\_name) | sets the name for the s3 bucket used by cloudtrail | `string` | `"tf-cloudtrail-logging-test-bucket-usman"` | no |
| <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name) | sets the name for new cloud trail name | `string` | `"tf-trail-new-cloudtrail"` | no |
| <a name="input_ct_include_global_service_events"></a> [ct\_include\_global\_service\_events](#input\_ct\_include\_global\_service\_events) | Whether the trail is publishing events from global services such as IAM to the log files. Defaults to true | `bool` | `true` | no |
| <a name="input_ct_s3_key_prefix"></a> [ct\_s3\_key\_prefix](#input\_ct\_s3\_key\_prefix) | S3 key prefix that follows the name of the bucket you have designated for log file delivery | `string` | `"prefix"` | no |
| <a name="input_data_resource_type"></a> [data\_resource\_type](#input\_data\_resource\_type) | Resource type in which you want to log data events. You can specify only the following value: 'AWS::S3::Object', 'AWS::Lambda::Function' and 'AWS::DynamoDB::Table' | `string` | `"AWS::S3::Object"` | no |
| <a name="input_data_resource_values"></a> [data\_resource\_values](#input\_data\_resource\_values) | value | `list(string)` | <pre>[<br>  "arn:aws:s3"<br>]</pre> | no |
| <a name="input_enable_log_file_validation"></a> [enable\_log\_file\_validation](#input\_enable\_log\_file\_validation) | Specifies whether log file integrity validation is enabled. Creates signed digest for validated contents of logs | `bool` | `true` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable logging for the trail | `bool` | `true` | no |
| <a name="input_exclude_management_event_sources"></a> [exclude\_management\_event\_sources](#input\_exclude\_management\_event\_sources) | A set of event sources to exclude. Valid values include: kms.amazonaws.com and rdsdata.amazonaws.com. include\_management\_events must be set totrue to allow this | `list(string)` | <pre>[<br>  "kms.amazonaws.com"<br>]</pre> | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | specifies force to destroy | `bool` | `true` | no |
| <a name="input_include_management_events"></a> [include\_management\_events](#input\_include\_management\_events) | Whether to include management events for your trail. Defaults to true | `bool` | `true` | no |
| <a name="input_insight_selector"></a> [insight\_selector](#input\_insight\_selector) | Specifies an insight selector for type of insights to log on a trail | <pre>list(object({<br>    insight_type = string<br>  }))</pre> | `[]` | no |
| <a name="input_is_multi_region_trail"></a> [is\_multi\_region\_trail](#input\_is\_multi\_region\_trail) | Specifies whether the trail is created in the current region or in all regions | `bool` | `true` | no |
| <a name="input_is_organization_trail"></a> [is\_organization\_trail](#input\_is\_organization\_trail) | The trail is an AWS Organizations trail | `bool` | `false` | no |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | Specifies the KMS key ARN to use to encrypt the logs delivered by CloudTrail | `string` | `""` | no |
| <a name="input_read_write_type"></a> [read\_write\_type](#input\_read\_write\_type) | Type of events to log. Valid values are ReadOnly, WriteOnly, All. Default value is All. | `string` | `"All"` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | sets the name for the s3 bucket used by cloudtrail | `string` | `"tf-cloudtrail-logging-test-bucket-usman"` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | Specifies the name of the Amazon SNS topic defined for notification of log file delivery | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_AWS_CloudTrail_ARN"></a> [AWS\_CloudTrail\_ARN](#output\_AWS\_CloudTrail\_ARN) | ARN OF AWS CloudTrail |

## Modules Usage
```
module "cloud_trail_module" {
  source                           = "../../../Modules/Management and Governance/Cloudtrail"
  cloudtrail_bucket_name           = var.cloudtrail_bucket_name
  cloudtrail_name                  = var.cloudtrail_name
  ct_s3_key_prefix                 = var.ct_s3_key_prefix
  ct_include_global_service_events = var.ct_include_global_service_events
  enable_logging                   = var.enable_logging
  enable_log_file_validation       = var.enable_log_file_validation
  sns_topic_name                   = var.sns_topic_name
  is_multi_region_trail            = var.is_multi_region_trail
  is_organization_trail            = var.is_organization_trail
  force_destroy                    = var.force_destroy
read_write_type                    = var.read_write_type
include_management_events          = var.include_management_events 
exclude_management_event_sources   = var.exclude_management_event_sources
data_resource_type                  = var.data_resource_type
data_resource_values               = var.data_resource_values
}
```

<!-- END_TF_DOCS -->