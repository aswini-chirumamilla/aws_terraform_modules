# Application Load Balancer
 ALB that only redirects requests (http and https) to new host, attaching of Target Group for use with Load Balancer, Creation of Load Balancer Listener Rule. 

## Prerequisite
* SSL Policy, S3 Bucket & ACM Certificate (AWS Certificate Manager). 
* VPC & its Subnets, Security Groups. 

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |


## Resources

| Name | Type |
|------|------|
| [aws_lb.application_load_balancer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.alb_http_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.alb_https_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.alb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_bucket"></a> [access\_bucket](#input\_access\_bucket) | (Required) The S3 bucket name to store the logs in. | `string` | n/a | yes |
| <a name="input_access_enabled"></a> [access\_enabled](#input\_access\_enabled) | (Optional) Boolean to enable / disable access\_logs | `bool` | `false` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | (ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS. | `string` | n/a | yes |
| <a name="input_cookie_duration"></a> [cookie\_duration](#input\_cookie\_duration) | (Optional) The time period, in seconds, during which requests from a client should be routed to the same target. | `number` | `86400` | no |
| <a name="input_cookie_name"></a> [cookie\_name](#input\_cookie\_name) | (Optional) Name of the application based cookie. | `string` | n/a | yes |
| <a name="input_delete_protect"></a> [delete\_protect](#input\_delete\_protect) | (Required) Deletion Protection for the ALB is mandatory | `bool` | n/a | yes |
| <a name="input_desync_mitigation"></a> [desync\_mitigation](#input\_desync\_mitigation) | (Optional) Determines how the load balancer handles requests that might pose a security risk to an application due to HTTP desync. | `string` | `"defensive"` | no |
| <a name="input_enable_http2"></a> [enable\_http2](#input\_enable\_http2) | (Optional) Indicates whether HTTP/2 is enabled in application load balancers. | `bool` | `true` | no |
| <a name="input_enable_waf_fail"></a> [enable\_waf\_fail](#input\_enable\_waf\_fail) | (Optional) Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF. | `bool` | `false` | no |
| <a name="input_hc_enabled"></a> [hc\_enabled](#input\_hc\_enabled) | (Optional) Whether health checks are enabled. | `bool` | `true` | no |
| <a name="input_hc_interval"></a> [hc\_interval](#input\_hc\_interval) | (Optional) Approximate amount of time, in seconds, between health checks of an individual target. | `number` | `30` | no |
| <a name="input_hc_matcher"></a> [hc\_matcher](#input\_hc\_matcher) | Response codes to use when checking for a healthy responses from a target. | `number` | n/a | yes |
| <a name="input_hc_path"></a> [hc\_path](#input\_hc\_path) | Destination for the health check request. | `string` | n/a | yes |
| <a name="input_hc_timeout"></a> [hc\_timeout](#input\_hc\_timeout) | Amount of time, in seconds, during which no response from a target means a failed health check. | `number` | n/a | yes |
| <a name="input_healthy_threshold"></a> [healthy\_threshold](#input\_healthy\_threshold) | (Optional) Number of consecutive health check successes required before considering a target healthy. | `number` | `3` | no |
| <a name="input_http_default_action_type"></a> [http\_default\_action\_type](#input\_http\_default\_action\_type) | Type of routing action. | `string` | n/a | yes |
| <a name="input_http_port"></a> [http\_port](#input\_http\_port) | (Optional) Port on which the load balancer is listening | `number` | `80` | no |
| <a name="input_http_protocol"></a> [http\_protocol](#input\_http\_protocol) | (Optional) Protocol for connections from clients to the load balancer. | `string` | `"HTTP"` | no |
| <a name="input_https_default_action_type"></a> [https\_default\_action\_type](#input\_https\_default\_action\_type) | Type of routing action. | `string` | n/a | yes |
| <a name="input_https_port"></a> [https\_port](#input\_https\_port) | (Optional) Port on which the load balancer is listening | `number` | `443` | no |
| <a name="input_https_protocol"></a> [https\_protocol](#input\_https\_protocol) | (Optional) Protocol for connections from clients to the load balancer. | `string` | `"HTTPS"` | no |
| <a name="input_idle_timeout"></a> [idle\_timeout](#input\_idle\_timeout) | (Optional) The time in seconds that the connection is allowed to be idle. | `number` | `60` | no |
| <a name="input_internal"></a> [internal](#input\_internal) | (Optional) If true, the LB will be internal. | `bool` | `false` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | (Optional) The type of IP addresses used by the subnets for your load balancer. | `string` | `"ipv4"` | no |
| <a name="input_lambda_multi_value"></a> [lambda\_multi\_value](#input\_lambda\_multi\_value) | (Optional) Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings. | `bool` | `false` | no |
| <a name="input_lb_algorithm_type"></a> [lb\_algorithm\_type](#input\_lb\_algorithm\_type) | (Optional) Determines how the load balancer selects targets when routing requests. | `string` | `"round_robin"` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Optional) The type of load balancer to create. | `string` | `"application"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | (Required) Specifies the name of the Load Balancer. | `string` | n/a | yes |
| <a name="input_public_subnet_ids"></a> [public\_subnet\_ids](#input\_public\_subnet\_ids) | (Optional) A list of subnet IDs to attach to the LB. | `list(string)` | `[]` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | (Optional) A list of security group IDs to assign to the LB. Only valid for Load Balancers of type application. | `list(string)` | `[]` | no |
| <a name="input_slow_start"></a> [slow\_start](#input\_slow\_start) | (Optional) Amount time for targets to warm up before the load balancer sends them a full share of requests. | `number` | `0` | no |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | (Required) Name of the SSL Policy for the listener if the protocol is HTTPS/ TLS. | `string` | n/a | yes |
| <a name="input_status_code"></a> [status\_code](#input\_status\_code) | (Required) HTTPS redirect code. | `string` | n/a | yes |
| <a name="input_stick_enabled"></a> [stick\_enabled](#input\_stick\_enabled) | (Optional) Boolean to enable / disable stickiness | `bool` | `true` | no |
| <a name="input_stick_type"></a> [stick\_type](#input\_stick\_type) | (Required) The type of sticky sessions. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags | `map(string)` | n/a | yes |
| <a name="input_target_name"></a> [target\_name](#input\_target\_name) | (Required) Specifies the name of the target group. | `string` | n/a | yes |
| <a name="input_target_port"></a> [target\_port](#input\_target\_port) | (Optional) The port the load balancer uses when performing health checks on targets. | `string` | `"traffic-port"` | no |
| <a name="input_target_protocol"></a> [target\_protocol](#input\_target\_protocol) | (Optional) Protocol the load balancer uses when performing health checks on targets. | `string` | `"HTTP"` | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | (May be required, Forces new resource) Type of target that you must specify when registering targets with this target group. | `string` | `"instance"` | no |
| <a name="input_unhealthy_threshold"></a> [unhealthy\_threshold](#input\_unhealthy\_threshold) | Optional) Number of consecutive health check failures required before considering a target unhealthy. | `number` | `3` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Identifier of the VPC in which to create the target group. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_target_group_arn"></a> [alb\_target\_group\_arn](#output\_alb\_target\_group\_arn) | ARN of the target group of ALB |
| <a name="output_application_load_balancer_dns_name"></a> [application\_load\_balancer\_dns\_name](#output\_application\_load\_balancer\_dns\_name) | DNS name of the application load balancer |
| <a name="output_application_load_balancer_zone_id"></a> [application\_load\_balancer\_zone\_id](#output\_application\_load\_balancer\_zone\_id) | zone ID of application load balancer |

## Usage as Module

| Name                                                                                     | Source                                                         | Version |
|------------------------------------------------------------------------------------------|----------------------------------------------------------------|---------|
| <a name="module_application_load_balancer"></a> [alb](#module\_application_load_balancer) | ../../Modules/Compute/alb| n/a |

```

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


