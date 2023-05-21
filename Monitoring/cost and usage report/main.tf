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
