module "application_load_balancer" {
  source                    = "../../../Modules/Compute/alb"
  project_name              = var.project_name
  target_name               = var.target_name
  tags                      = merge(local.tags, var.tags)
  internal                  = var.internal
  load_balancer_type        = var.load_balancer_type
  sg_id                     = var.sg_id
  public_subnet_ids         = var.public_subnet_ids
  delete_protect            = var.delete_protect
  desync_mitigation         = var.desync_mitigation
  enable_http2              = var.enable_http2
  enable_waf_fail           = var.enable_waf_fail
  idle_timeout              = var.idle_timeout
  access_bucket             = var.access_bucket
  access_enabled            = var.access_enabled
  access_prefix             = var.access_prefix
  ip_address_type           = var.ip_address_type
  target_type               = var.target_type
  target_port               = var.target_port
  target_protocol           = var.target_protocol
  vpc_id                    = var.vpc_id
  lambda_multi_value        = var.lambda_multi_value
  lb_algorithm_type         = var.lb_algorithm_type
  slow_start                = var.slow_start
  hc_enabled                = var.hc_enabled
  hc_interval               = var.hc_interval
  hc_path                   = var.hc_path
  hc_timeout                = var.hc_timeout
  hc_matcher                = var.hc_matcher
  healthy_threshold         = var.healthy_threshold
  unhealthy_threshold       = var.unhealthy_threshold
  stick_type                = var.stick_type
  cookie_duration           = var.cookie_duration
  cookie_name               = var.cookie_name
  stick_enabled             = var.stick_enabled
  http_port                 = var.http_port
  http_protocol             = var.http_protocol
  http_default_action_type  = var.http_default_action_type
  https_port                = var.https_port
  https_protocol            = var.https_protocol
  ssl_policy                = var.ssl_policy
  status_code               = var.status_code
  https_default_action_type = var.https_default_action_type
  certificate_arn           = var.certificate_arn
}

locals {
  name_tag_val = join("-", [data.aws_caller_identity.current.account_id, data.aws_availability_zones.az.id])
  tags         = { Name = local.name_tag_val }
}
