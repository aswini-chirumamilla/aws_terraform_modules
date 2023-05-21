#providers

aws_region  = "ap-south-1"
aws_profile = "default"

#application_load_balancers

project_name = "eycillb-alb3"
target_name  = "eycillb-tg3"
tags = {
  "env" : "prod"
}
internal                  = false
load_balancer_type        = "application"
target_type               = "ip"
target_port               = 80
target_protocol           = "HTTP"
vpc_id                    = "vpc-03a2794720d039966"
sg_id                     = ["sg-0db87ac6f09cd6b28"]
public_subnet_ids         = ["subnet-06f766a66be7c92d6", "subnet-00132ca4e8c8a32a2"]
delete_protect            = true
desync_mitigation         = "defensive"
enable_http2              = true
enable_waf_fail           = false
idle_timeout              = 60
ip_address_type           = "ipv4"
access_bucket             = "albciltestbucketey001"
access_enabled            = true
access_prefix             = "alb1/"
lambda_multi_value        = false
lb_algorithm_type         = "round_robin"
slow_start                = 30
stick_type                = "lb_cookie"
cookie_duration           = 86400
cookie_name               = "EYCILSTICK"
stick_enabled             = true
hc_enabled                = true
hc_interval               = 300
hc_path                   = "/"
hc_timeout                = 60
hc_matcher                = 200
healthy_threshold         = 5
unhealthy_threshold       = 5
http_port                 = 80
http_protocol             = "HTTP"
http_default_action_type  = "redirect"
https_port                = 443
https_protocol            = "HTTPS"
ssl_policy                = "ELBSecurityPolicy-2016-08"
status_code               = "HTTP_301"
https_default_action_type = "forward"
certificate_arn           = "arn:aws:acm:ap-south-1:239312700453:certificate/bc7188ed-8bb1-4c3f-bf4c-2e0b7afd25b9"








