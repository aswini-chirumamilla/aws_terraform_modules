## Cost and Usage Report
The AWS Cost and Usage Report offers a comprehensive set of cost and usage data across AWS. It includes metadata about AWS services, credit, pricing, fees, discounts, taxes, cost categories, Savings Plans, and Reserved Instances. You can view the Cost and Usage Report at monthly, daily, or hourly levels of granularity.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.48.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cur_report_definition.cur_report_definition](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cur_report_definition) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_artifacts"></a> [additional\_artifacts](#input\_additional\_artifacts) | A list of additional artifacts. Valid values are: REDSHIFT, QUICKSIGHT, ATHENA. When ATHENA exists within additional\_artifacts, no other artifact type can be declared and report\_versioning must be OVERWRITE\_REPORT | `list(string)` | n/a | yes |
| <a name="input_additional_schema_elements"></a> [additional\_schema\_elements](#input\_additional\_schema\_elements) | A list of schema elements. Valid values are: RESOURCES | `list(string)` | n/a | yes |
| <a name="input_compression"></a> [compression](#input\_compression) | Compression format for report. Valid values are: GZIP, ZIP, Parquet. If Parquet is used, then format must also be Parquet | `string` | n/a | yes |
| <a name="input_format"></a> [format](#input\_format) | Format for report. Valid values are: textORcsv | `string` | n/a | yes |
| <a name="input_refresh_closed_reports"></a> [refresh\_closed\_reports](#input\_refresh\_closed\_reports) | Set to true to update your reports after they have been finalized if AWS detects charges related to previous months | `string` | n/a | yes |
| <a name="input_report_name"></a> [report\_name](#input\_report\_name) | Unique name for the report. Must start with a number/letter and is case sensitive | `string` | n/a | yes |
| <a name="input_report_versioning"></a> [report\_versioning](#input\_report\_versioning) | Overwrite the previous version of each report or to deliver the report in addition to the previous versions. Valid values are: CREATE\_NEW\_REPORT and OVERWRITE\_REPORT | `string` | n/a | yes |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | Name of the existing S3 bucket to hold generated reports | `string` | n/a | yes |
| <a name="input_s3_prefix"></a> [s3\_prefix](#input\_s3\_prefix) | Report path prefix | `string` | n/a | yes |
| <a name="input_s3_region"></a> [s3\_region](#input\_s3\_region) | Region of the existing S3 bucket to hold generated reports | `string` | n/a | yes |
| <a name="input_s3policy_filepath"></a> [s3policy\_filepath](#input\_s3policy\_filepath) | S3 policy file | `string` | `null` | no |
| <a name="input_time_unit"></a> [time\_unit](#input\_time\_unit) | The frequency on which report data are measured and displayed. Valid values are: DAILY, HOURLY, MONTHLY | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Cost_Usage_Report_ARN"></a> [Cost\_Usage\_Report\_ARN](#output\_Cost\_Usage\_Report\_ARN) | sets the name for the cost and usage report |

## Usage as Modules

| Name                                                   | Source | Version |
|--------------------------------------------------------|--------|---------|
| <a name="module_Cost_Usage_Report"></a> [Cost_Usage_Report](#module_Cost_Usage_Report) | ../../../Modules/Monitoring/cost and usage report| n/a |

```
module "aws_cur_report_definition" {

  source                     = "../../../Modules/Monitoring/cost and usage report"
  report_name                = var.report_name
  time_unit                  = var.time_unit
  format                     = var.format
  compression                = var.compression
  additional_schema_elements = var.additional_schema_elements
  s3_bucket                  = var.s3_bucket
  s3_region                  = var.s3_region
  additional_artifacts       = var.additional_artifacts
  s3policy_filepath          = var.s3policy_filepath
  s3_prefix                  = var.s3_prefix
  refresh_closed_reports     = var.refresh_closed_reports
  report_versioning          = var.report_versioning

} 
~~~