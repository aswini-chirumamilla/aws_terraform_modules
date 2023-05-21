resource "aws_cloudwatch_log_group" "cloudwatch_log_group" {
  name              = var.log_group_name
  retention_in_days = var.retention_in_days
  kms_key_id        = var.kms_key_id

  tags = var.tags

}

resource "aws_cloudwatch_log_stream" "cloudwatch_log_stream" {
  name           = var.log_stream_name
  log_group_name = aws_cloudwatch_log_group.cloudwatch_log_group.name
}

resource "aws_cloudwatch_log_destination" "cloudwatch_destination" {

  name       = var.cw_log_destination_name
  role_arn   = var.cw_log_role_arn
  target_arn = var.cw_log_target_arn

}

resource "aws_cloudwatch_log_metric_filter" "cloudwatch_metric_filter" {
  name           = var.filter_name
  pattern        = var.pattern
  log_group_name = aws_cloudwatch_log_group.cloudwatch_log_group.name

  metric_transformation {
    name      = var.metric_name
    namespace = var.namespace
    value     = var.metric_value
    unit      = var.metric_unit
  }
}

resource "aws_cloudwatch_log_subscription_filter" "cloudwatch_subscription_filter" {
  name            = var.subs_name
  role_arn        = var.cw_log_role_arn_subs
  log_group_name  = aws_cloudwatch_log_group.cloudwatch_log_group.name
  filter_pattern  = var.subs_pattern
  destination_arn = var.cw_log_target_arn_subs
  distribution    = var.distribution
}
