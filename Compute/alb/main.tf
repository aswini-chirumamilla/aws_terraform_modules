# create application load balancer
resource "aws_lb" "application_load_balancer" {
  name                       = var.project_name
  internal                   = var.internal
  load_balancer_type         = var.load_balancer_type
  security_groups            = var.sg_id
  subnets                    = var.public_subnet_ids
  enable_deletion_protection = var.delete_protect
  drop_invalid_header_fields = true
  desync_mitigation_mode     = var.desync_mitigation
  enable_http2               = var.enable_http2
  enable_waf_fail_open       = var.enable_waf_fail
  idle_timeout               = var.idle_timeout
  ip_address_type            = var.ip_address_type

  access_logs {
    bucket  = var.access_bucket
    enabled = var.access_enabled
    prefix  = var.access_prefix
  }

  tags = var.tags
}

# create target group
resource "aws_lb_target_group" "alb_target_group" {
  name                               = var.target_name
  target_type                        = var.target_type
  port                               = var.target_port
  protocol                           = var.target_protocol
  vpc_id                             = var.vpc_id
  lambda_multi_value_headers_enabled = var.lambda_multi_value
  load_balancing_algorithm_type      = var.lb_algorithm_type
  slow_start                         = var.slow_start

  tags = var.tags

  health_check {
    enabled             = var.hc_enabled
    interval            = var.hc_interval
    path                = var.hc_path
    timeout             = var.hc_timeout
    matcher             = var.hc_matcher
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }

  stickiness {
    type            = var.stick_type
    cookie_duration = var.cookie_duration
    cookie_name     = var.cookie_name
    enabled         = var.stick_enabled
  }

  lifecycle {
    create_before_destroy = true
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.http_port
  protocol          = var.http_protocol

  default_action {
    type = var.http_default_action_type
    redirect {
      port        = var.https_port
      protocol    = var.https_protocol
      status_code = var.status_code
    }


  }

  tags = var.tags

}

# create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = var.https_port
  protocol          = var.https_protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type             = var.https_default_action_type
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }

  tags = var.tags

}
