########################################
# Variable for Delegation id
########################################

variable "reference_name" {
  type        = string
  description = "This is a reference name used in Caller Reference (helpful for identifying single delegation set amongst others)"
  default     = null
}

########################################
# Variable for zone
########################################

variable "name" {
  type        = string
  description = "The name of the zone."
}

variable "comment" {
  type        = string
  description = "The name of the comment to be given for the zone"
}

variable "force_destroy" {
  type        = bool
  description = "Whether to destroy all records (possibly managed outside of Terraform) in the zone when destroying the zone."
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC to use for association"
  default     = null
}

variable "vpc_region" {
  type        = string
  description = "Region of the VPC to associate. Defaults to AWS provider region."
  default     = null
}

########################################
# Variable for Route53 record 
########################################

variable "aws_route53_record" {
  description = "A configuration block that defines settings available for aws_route53_record resource"
  type = map(object({
    record_name                      = string #Name of the record 
    type                             = string  #The protocol to use when performing health checks.Valid values are A, AAAA, CAA, CNAME, DS, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT.
    ttl                              = number         #Required for non alias records.This needs to be passed as null for creating alias records
    records                          = list(string) #Required for non alias records.This needs to be passed as null for creating alias records
    set_identifier                   = string #Unique identifier to differentiate records with routing policies from one another.Required values are cidr_routing_policy, failover_routing_policy, geolocation_routing_policy, latency_routing_policy, multivalue_answer_routing_policy, or weighted_routing_policy.
    health_check_id                  = string #The health check the record should be associated with.
    multivalue_answer_routing_policy = optional(bool, null) #et to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy.
    allow_overwrite                  = optional(bool, false) #"Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments."

    weighted_routing_policy = list(object({
      weight = string #A numeric value indicating the relative weight of the record
    }))
    latency_routing_policy = list(object({
      region = string #An AWS region from which to measure latency
    }))
    geolocation_routing_policy = list(object({
      continent   = string #A two-letter continent code
      subdivision = string #A subdivision code for a country.
      country     = string #A two-character country code or * to indicate a default resource record set.
    }))
    cidr_routing_policy = list(object({
      collection_id = string #The CIDR collection ID."
      location_name = string #The CIDR collection location name. See the aws_route53_cidr_location resource for more details. A location_name with an asterisk * can be used to create a default CIDR record. collection_id is still required for default record."
    }))
    failover_routing_policy = list(object({
      type = string #PRIMARY or SECONDARY. A PRIMARY record will be served if its healthcheck is passing, otherwise the SECONDARY will be served."
    })) 
    # For creation of alias records ttl and records needs to be passed as null values
    alias = list(object({
      alias_name             = string #DNS domain name for a CloudFront distribution, S3 bucket, ELB, or another resource record set in this hosted zone."
      zone_id_alias          = string #Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone.
      evaluate_target_health = bool #Set to true if you want Route 53 to determine whether to respond to DNS queries using this resource record set by checking the health of the resource record set.
    }))
  }))
  default = {}

}

########################################
# Variable for cloudwatch log group 
########################################

variable "retention_in_days" {
  type        = number
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, 3653, and 0. If you select 0, the events in the log group are always retained and never expire."
  default     = null
}

variable "aws_cloudwatch_log_group_name" {
  description = "Name of the the cloudwatch log group to store logs"
  type = string 
}

########################################
# Variable for cloudwatch log policy 
########################################

variable "policy_name" {
  type        = string
  description = "name of the policy to be attached to the log group"
}

variable "policy_path" {
  description = "Name of the the cloudwatch log group to store logs"
  type = string 
  default = null
}


########################################
# Variable for cloudwatch query log 
########################################

variable "enable_logging" {
  type        = bool
  description = "If we want to enable logging in the resource then set to true "
  default     = false
}

########################################
# Variable for Route 53 zone association
########################################

variable "association_vpc_ids" {
  description = "A configuration block that defines additional settings available for vpc id and vpc region to be associated in the zone"
  type = map(object({
    association_vpc_id     = string
    association_vpc_region = string
  }))
  default = {}
}

#######################################################
# Variable for tags
#######################################################

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the zone. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}




