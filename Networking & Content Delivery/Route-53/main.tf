########################################################
##              Create Delegation id
########################################################

resource "aws_route53_delegation_set" "delegation_id" {
  count          = var.reference_name != null ? 1 : 0
  reference_name = var.reference_name
}

########################################################
##              Create Route-53 Zone 
########################################################

resource "aws_route53_zone" "hosted_zone" {
  name              = var.name
  comment           = var.comment
  delegation_set_id = var.reference_name != null ? aws_route53_delegation_set.delegation_id[0].id : null
  # Delegation set id conflicts with VPC 
  force_destroy = var.force_destroy
  tags          = var.tags

  dynamic "vpc" {
    for_each = var.vpc_id != null && var.vpc_region != null ? [1] : []
    content {
      vpc_id     = var.vpc_id
      vpc_region = var.vpc_region
    }
  }
}

####################################################
#     Create Route53 record sets resource on AWS.
####################################################

resource "aws_route53_record" "route53" {
  for_each                         = var.aws_route53_record
  zone_id                          = aws_route53_zone.hosted_zone.id
  name                             = lookup(each.value, "record_name")
  type                             = lookup(each.value, "type")
  ttl                              = lookup(each.value, "ttl")
  records                          = lookup(each.value, "records")
  set_identifier                   = lookup(each.value, "set_identifier")
  health_check_id                  = lookup(each.value, "health_check_id")
  multivalue_answer_routing_policy = lookup(each.value,"multivalue_answer_routing_policy")
  #multivalue_answer_routing_policy conflicts with other routing policies
  allow_overwrite = lookup(each.value, "allow_overwrite")

  ## POLICY CONFLICTS WITH EACH OTHER SO CHOOSE ONLY ONE and comment others

  dynamic "weighted_routing_policy" {
    for_each = lookup(each.value, "set_identifier") == "weighted_routing_policy" ? lookup(each.value, "weighted_routing_policy") : []
    content {
      weight = lookup(weighted_routing_policy.value, "weight")
    }
  }
  
  dynamic "latency_routing_policy" {
    for_each = lookup(each.value, "set_identifier") == "latency_routing_policy" ? lookup(each.value, "latency_routing_policy") : []
    content {
      region = lookup(latency_routing_policy.value, "region")
    }
  }
 
  dynamic "geolocation_routing_policy" {
    for_each = lookup(each.value, "set_identifier") == "geolocation_routing_policy" ? lookup(each.value, "geolocation_routing_policy") : []
    content {
      continent   = lookup(geolocation_routing_policy.value, "continent")
      subdivision = lookup(geolocation_routing_policy.value, "subdivision")
      country     = lookup(geolocation_routing_policy.value, "country")
    }
  }

  dynamic "failover_routing_policy" {
    for_each = lookup(each.value, "set_identifier") == "failover_routing_policy" ? lookup(each.value, "failover_routing_policy") : []
    content {
      type = lookup(failover_routing_policy.value, "type")
      }
    }

  dynamic "cidr_routing_policy" {
    for_each = lookup(each.value, "set_identifier") == "cidr_routing_policy" ? lookup(each.value, "cidr_routing_policy") : []
    content {
      collection_id = lookup(cidr_routing_policy.value, "collection_id")
      location_name = lookup(cidr_routing_policy.value, "location_name")
    }
  }


dynamic "alias" {
    for_each = (lookup(each.value, "ttl") == null) && (lookup(each.value, "records") == null ) ? lookup(each.value, "alias") : []
    content {
      name                   = lookup(each.value, "alias_name")
      zone_id                = lookup(each.value, "zone_id_alias")
      evaluate_target_health = lookup(each.value, "evaluate_target_health")
    }
  }
}

#######################################################
#   Create cloudwatch log group
#######################################################

resource "aws_cloudwatch_log_group" "aws_route53_example_com" {
  count             = (var.vpc_id == null && var.enable_logging == true) ? 1 : 0
  name              = var.aws_cloudwatch_log_group_name
  retention_in_days = var.retention_in_days
}

#######################################################
#  Create cloudwatch log policy
#######################################################

resource "aws_cloudwatch_log_resource_policy" "route53-query-logging-policy" {
  policy_document = file("${var.policy_path}")
  policy_name     = var.policy_name
}

#######################################################
#  Create query log in cloudwatch log group
# Logs can not be created for private zone 
#######################################################

resource "aws_route53_query_log" "query_log" {
  count                    = (var.vpc_id == null && var.enable_logging == true) ? 1 : 0
  depends_on               = [aws_cloudwatch_log_resource_policy.route53-query-logging-policy]
  cloudwatch_log_group_arn = aws_cloudwatch_log_group.aws_route53_example_com[0].arn
  zone_id                  = aws_route53_zone.hosted_zone.id
}

#######################################################
#  Create zone association 
#  It can only be created if zone is private 
#######################################################
 
resource "aws_route53_zone_association" "zone_association" {
  for_each   = (var.association_vpc_ids != null && var.vpc_id != null) ? var.association_vpc_ids : {}
  zone_id    = aws_route53_zone.hosted_zone.id
  vpc_id     = lookup(each.value, "association_vpc_id", null)
  vpc_region = lookup(each.value, "association_vpc_region", null)
}

  
