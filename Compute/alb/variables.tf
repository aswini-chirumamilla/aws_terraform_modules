# variables of application load balancer

variable "project_name" {
  type        = string
  description = "(Required) Specifies the name of the Load Balancer."
}

variable "target_name" {
  type        = string
  description = "(Required) Specifies the name of the target group."

}

variable "internal" {
  type        = bool
  description = "(Optional) If true, the LB will be internal."
  default     = false
}

variable "load_balancer_type" {
  type        = string
  description = "Optional) The type of load balancer to create."
  default     = "application"
}

variable "sg_id" {
  description = "(Optional) A list of security group IDs to assign to the LB. Only valid for Load Balancers of type application."
  type        = list(string)
  default     = []

}

variable "public_subnet_ids" {
  description = "(Optional) A list of subnet IDs to attach to the LB."
  type        = list(string)
  default     = []

}

variable "delete_protect" {
  type        = bool
  description = "(Required) Deletion Protection for the ALB is mandatory"

}

variable "desync_mitigation" {
  type        = string
  description = "(Optional) Determines how the load balancer handles requests that might pose a security risk to an application due to HTTP desync."
  default     = "defensive"
  validation {
    condition     = var.desync_mitigation == "monitor" || var.desync_mitigation == "defensive" || var.desync_mitigation == "strictest"
    error_message = "Desync Mitigation mode should be monitor, defensive or strictest"
  }
}

variable "enable_http2" {
  type        = bool
  description = "(Optional) Indicates whether HTTP/2 is enabled in application load balancers."
  default     = true
}

variable "enable_waf_fail" {
  type        = bool
  description = "(Optional) Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF."
  default     = false
}

variable "idle_timeout" {
  type        = number
  description = "(Optional) The time in seconds that the connection is allowed to be idle."
  default     = 60

}

variable "ip_address_type" {
  type        = string
  description = "(Optional) The type of IP addresses used by the subnets for your load balancer."
  default     = "ipv4"
  validation {
    condition     = var.ip_address_type == "ipv4" || var.ip_address_type == "dualstack"
    error_message = "IP Address Type should be ipv4 or dualstack"
  }
}


variable "access_bucket" {
  type        = string
  description = "(Required) The S3 bucket name to store the logs in."
}

variable "access_enabled" {
  type        = bool
  description = "(Optional) Boolean to enable / disable access_logs"
  default     = false

}

variable "access_prefix" {
  type        = string
  description = "(Optional) The S3 bucket prefix. Logs are stored in the root if not configured."
  default     = null

}

# variables of target group

variable "target_type" {
  description = "(May be required, Forces new resource) Type of target that you must specify when registering targets with this target group."
  type        = string
  default     = "instance"
}

variable "target_port" {
  description = "(Optional) The port the load balancer uses when performing health checks on targets."
  type        = string
  default     = "traffic-port"
}

variable "target_protocol" {
  description = "(Optional) Protocol the load balancer uses when performing health checks on targets."
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "Identifier of the VPC in which to create the target group."
  type        = string
}

variable "hc_enabled" {
  description = "(Optional) Whether health checks are enabled."
  type        = bool
  default     = true
}

variable "hc_interval" {
  description = "(Optional) Approximate amount of time, in seconds, between health checks of an individual target."
  type        = number
  default     = 30
  validation {
    condition     = var.hc_interval >= 5 && var.hc_interval <= 300
    error_message = "The interval range should be between 2 to 120 seconds"
  }
}

variable "hc_path" {
  description = "Destination for the health check request."
  type        = string
}

variable "hc_timeout" {
  description = "Amount of time, in seconds, during which no response from a target means a failed health check."
  type        = number
  validation {
    condition     = var.hc_timeout >= 2 && var.hc_timeout <= 120
    error_message = "The timeout range should be between 2 to 120 seconds"
  }
}

variable "hc_matcher" {
  description = "Response codes to use when checking for a healthy responses from a target."
  type        = number
}

variable "healthy_threshold" {
  description = "(Optional) Number of consecutive health check successes required before considering a target healthy."
  type        = number
  default     = 3
  validation {
    condition     = var.healthy_threshold >= 2 && var.healthy_threshold <= 10
    error_message = "The healthy threshold range should be between 2 to 10"
  }
}

variable "unhealthy_threshold" {
  description = "Optional) Number of consecutive health check failures required before considering a target unhealthy."
  type        = number
  default     = 3
  validation {
    condition     = var.unhealthy_threshold >= 2 && var.unhealthy_threshold <= 10
    error_message = "The unhealthy threshold range should be between 2 to 120 seconds"
  }
}


variable "lambda_multi_value" {
  type        = bool
  default     = false
  description = "(Optional) Whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings."
}

variable "lb_algorithm_type" {
  type        = string
  description = "(Optional) Determines how the load balancer selects targets when routing requests."
  default     = "round_robin"
  validation {
    condition     = var.lb_algorithm_type == "round_robin" || var.lb_algorithm_type == "least_outstanding_requests"
    error_message = "Enter valid LB Algorithm type"
  }
}

variable "slow_start" {
  type        = number
  description = "(Optional) Amount time for targets to warm up before the load balancer sends them a full share of requests."
  default     = 0
}

variable "stick_type" {
  type        = string
  description = "(Required) The type of sticky sessions."
  validation {
    condition     = var.stick_type == "lb_cookie" || var.stick_type == "app_cookie"
    error_message = "The only current possible values are lb_cookie, app_cookie for ALBs"
  }
}

variable "cookie_duration" {
  type        = number
  description = "(Optional) The time period, in seconds, during which requests from a client should be routed to the same target."
  default     = 86400
}

variable "cookie_name" {
  type        = string
  description = "(Optional) Name of the application based cookie."
}

variable "stick_enabled" {
  type        = bool
  description = "(Optional) Boolean to enable / disable stickiness"
  default     = true
}

#variables of HTTP

variable "http_port" {
  description = "(Optional) Port on which the load balancer is listening"
  type        = number
  default     = 80
}

variable "http_protocol" {
  description = "(Optional) Protocol for connections from clients to the load balancer."
  type        = string
  default     = "HTTP"
  validation {
    condition     = var.http_protocol == "HTTP" || var.http_protocol == "HTTPS"
    error_message = "For application load balancer, the protocol should be either HTTP or HTTPS"
  }
}

variable "http_default_action_type" {
  description = "Type of routing action."
  type        = string
  validation {
    condition     = var.http_default_action_type == "forward" || var.http_default_action_type == "redirect" || var.http_default_action_type == "fixed-response" || var.http_default_action_type == "authenticate-cognito" || var.http_default_action_type == "authenticate-oidc"
    error_message = "Give valid default action type"
  }
}

#variables of HTTPS

variable "https_port" {
  description = "(Optional) Port on which the load balancer is listening"
  type        = number
  default     = 443
}

variable "https_protocol" {
  description = "(Optional) Protocol for connections from clients to the load balancer."
  type        = string
  default     = "HTTPS"
  validation {
    condition     = var.https_protocol == "HTTP" || var.https_protocol == "HTTPS"
    error_message = "For application load balancer, the protocol should be either HTTP or HTTPS"
  }
}

variable "ssl_policy" {
  description = "(Required) Name of the SSL Policy for the listener if the protocol is HTTPS/ TLS."
  type        = string
}

variable "status_code" {
  description = "(Required) HTTPS redirect code."
  type        = string
}

variable "https_default_action_type" {
  description = "Type of routing action."
  type        = string
  validation {
    condition     = var.https_default_action_type == "forward" || var.https_default_action_type == "redirect" || var.https_default_action_type == "fixed-response" || var.https_default_action_type == "authenticate-cognito" || var.https_default_action_type == "authenticate-oidc"
    error_message = "Give valid default action type"
  }
}

variable "certificate_arn" {
  description = "(ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS."
  type        = string
}

#tags

variable "tags" {
  description = "tags"
  type        = map(string)
}









