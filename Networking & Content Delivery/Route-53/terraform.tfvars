aws_region  = "us-east-1"
aws_profile = "Terraform"
#reference_name conflicts with VPC
reference_name = "reference-name"
name           = "www.route53wright.com"
comment        = "comment on zone"
force_destroy  = true

#VPC Conflicts with delegation id 
/* vpc_id     = "vpc-0dda9d2ae5cd0d518"
vpc_region = "us-east-1" */

aws_route53_record = { 
  "config1" = {
    record_name     = "Route53-record" 
    type            = "SRV"
    ttl             = 300
    records         = ["10 23 33 route53record123432423"]
    set_identifier  = "latency_routing_policy"
    health_check_id = "44a84c63-9875-40ea-aac6-2d56d1d21c39"
    allow_overwrite = false
    weighted_routing_policy = [{
      "weight" = "us-east-1"
    }]
    latency_routing_policy = [{
      "region" = "us-east-1"
    }]
    geolocation_routing_policy = [{
      "continent"   = "NA"
      "subdivision" = "AL"
      "country"     = "*"
    }]
    cidr_routing_policy = [{
      "collection_id" = "200.5.3.0/24"
      "location_name" = "office"
    }]
    failover_routing_policy = [{
      "type" = "PRIMARY"
    }]
    alias = [{
      "alias_name"             = "www.route531.com"
      "zone_id_alias"          = "4Z051249434QDU2UTZ4"
      "evaluate_target_health" = false
    }]
  }
}
retention_in_days = 30
aws_cloudwatch_log_group_name = "route53/record/log-group"
policy_name       = "route53-logging-policy"
policy_path = "policy.json"
enable_logging    = true
association_vpc_ids = {
  "config1" = {
    association_vpc_id     = "vpc-0ba4b023ec085297e"
    association_vpc_region = "us-east-1"
  }
}
tags = {
  "env" : "prod"
}

