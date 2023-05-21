# Deploys the cloudtrail resource
resource "aws_cloudtrail" "new_trail" {
  name                          =  var.cloudtrail_name
  s3_bucket_name                =  var.s3_bucket_name
  s3_key_prefix                 =  var.ct_s3_key_prefix
  enable_logging                =  var.enable_logging
  enable_log_file_validation    =  var.enable_log_file_validation
  sns_topic_name                =  var.sns_topic_name
  is_multi_region_trail         =  var.is_multi_region_trail
  include_global_service_events =  var.ct_include_global_service_events
  cloud_watch_logs_role_arn     =  var.cloud_watch_logs_role_arn
  cloud_watch_logs_group_arn    =  var.cloud_watch_logs_group_arn
  kms_key_id                    =  var.kms_key_arn
  is_organization_trail         =  var.is_organization_trail
  
   dynamic "insight_selector" {
    for_each = var.insight_selector
    content {
      insight_type = insight_selector.value.insight_type
    }
  }
    event_selector {
    read_write_type           = var.read_write_type  
    include_management_events = var.include_management_events
    exclude_management_event_sources = var.exclude_management_event_sources


    data_resource {
      type   = var.data_resource_type
      values = var.data_resource_values
    }
  }
}




