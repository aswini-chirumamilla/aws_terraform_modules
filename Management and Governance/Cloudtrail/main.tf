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