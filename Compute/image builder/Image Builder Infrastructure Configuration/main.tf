resource "aws_imagebuilder_infrastructure_configuration" "infra_config" {
  name                          = var.infra_config_name
  instance_profile_name         = var.instance_profile_name
  description                   = var.infra_config_description
  instance_types                = var.instance_types
  key_pair                      = var.key_pair
  security_group_ids            = var.security_group_ids
  sns_topic_arn                 = var.sns_topic_arn
  subnet_id                     = var.subnet_id
  terminate_instance_on_failure = var.terminate_instance_on_failure

  dynamic "logging" {
    for_each = var.enable_logging ? [var.logging] : []
    content {
      s3_logs {
        s3_bucket_name = lookup(logging.value, "s3_bucket_name", null)
        s3_key_prefix  = lookup(logging.value, "s3_key_prefix", null)
      }
    }
  }
  
  tags = var.tags
}
