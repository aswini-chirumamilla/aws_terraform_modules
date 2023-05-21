module "cloudwatch_log_resources" {
  source                  = "../../../Modules/Monitoring/Cloudwatch log resources"
  log_group_name          = var.log_group_name
  retention_in_days       = var.retention_in_days
  kms_key_id              = var.kms_key_id
  log_stream_name         = var.log_stream_name
  cw_log_destination_name = var.cw_log_destination_name
  cw_log_role_arn         = var.cw_log_role_arn
  cw_log_target_arn       = var.cw_log_target_arn
  namespace               = var.namespace
  filter_name             = var.filter_name
  pattern                 = var.pattern
  metric_name             = var.metric_name
  metric_value            = var.metric_value
  metric_unit             = var.metric_unit
  subs_name               = var.subs_name
  cw_log_role_arn_subs    = var.cw_log_role_arn_subs
  subs_pattern            = var.subs_pattern
  cw_log_target_arn_subs  = var.cw_log_target_arn_subs
  distribution            = var.distribution
  tags                    = merge(local.tags, var.tags)
}

locals {
  name_tag_val = join("-", [data.aws_caller_identity.current.account_id, data.aws_availability_zones.az.id])
  tags         = { Name = local.name_tag_val }
}
