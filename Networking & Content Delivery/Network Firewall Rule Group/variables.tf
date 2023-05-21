variable "aws_region" {
  description = "AWS_Region"
  default     = "us-east-2"
  type        = string
}

variable "aws_profile" {
  description = "AWS_profile"
  default     = "terraform"
  type        = string
}

# AWS Network Firewall resource Variables
variable "rule_group_name" {
  description = "The descriptive name of the Network Firewall Rule Group."
  type        = string
}

variable "rule_group_description" {
  description = "A description of the Network Firewall Rule Group."
  type        = string
}

variable "rule_group_type" {
  description = "Provide the Rule Group type, whether the Netwwork Firewall Rule Group is STATEFUL or STATELESS. Valid values include: STATEFUL or STATELESS."
  type        = string
  validation {
    condition     = contains(["STATEFUL", "STATELESS"], var.rule_group_type)
    error_message = "Argument 'rule_group_type' must one of 'STATEFUL', or 'STATELESS'."
  }
}

variable "rule_group_capacity" {
  description = "TThe maximum operating resources that this rule group can use. You can't change a rule group's capacity setting after you create the rule group. When you update a rule group, you are limited to this capacity. When you reference a rule group from a firewall policy, Network Firewall reserves this capacity for the rule group."
  type        = string
}

variable "kms_key_alias_name" {
  description = "Provide Alias name for Customer Managed KMS Key for encryption of Network Firewall. Provide the null value for using the default AWS-managed KMS encryption."
  type        = string
  default     = null
}

variable "stateful_reference_sets" {
  description = "References to the stateless rule groups that are used in the policy. These define the matching criteria in stateless rules. Priority must be set for Stateless rule groups."
  type = list(object({
    key           = string
    reference_arn = string
  }))
  default = []
}

variable "stateful_rule_options" {
  description = "Indicates how to manage the order of the rule evaluation for the rule group. DEFAULT_ACTION_ORDER is the default behavior. Stateful rules are provided to the rule engine as Suricata compatible strings, and Suricata evaluates them based on certain settings"
  type        = string
  validation {
    condition     = contains(["DEFAULT_ACTION_ORDER", "STRICT_ORDER"], var.stateful_rule_options)
    error_message = "Argument 'stateful_rule_options' must one of 'DEFAULT_ACTION_ORDER', or 'STRICT_ORDER'."
  }
  default = "DEFAULT_ACTION_ORDER"
}

variable "rules_string" {
  description = "The fully qualified name of a file in an S3 bucket that contains Suricata compatible intrusion preventions system (IPS) rules or the Suricata rules as a string. These rules contain stateful inspection criteria and the action to take for traffic that matches the criteria."
  type        = string
  default     = null
}

variable "stateful_ipset_rule_variables" {
  description = "A configuration block that defines additional settings available for IP Sets to use in the rules defined in the rule group. Can only be specified for stateful rule groups."
  type = list(object({
    key        = string
    definition = list(string)
  }))
  default = []
}

variable "stateful_portset_rule_variables" {
  description = "A configuration block that defines additional settings available for Port Sets to use in the rules defined in the rule group. Can only be specified for stateful rule groups."
  type = list(object({
    key        = string
    definition = list(string)
  }))
  default = []
}

variable "rules_source_list" {
  description = "A configuration block that defines additional settings available for Port Sets to use in the rules defined in the rule group. Can only be specified for stateful rule groups."
  type = list(object({
    generated_rules_type = string
    target_types         = list(string)
    targets              = list(string)

  }))
  default = []
}

variable "stateful_rules" {
  description = "A configuration block that defines additional settings available for Port Sets to use in the rules defined in the rule group. Can only be specified for stateful rule groups."
  type = list(object({
    action = string
    header = object({
      protocol         = string
      source           = string
      source_port      = string
      destination      = string
      destination_port = string
      direction        = string
    })
    rule_option = object({
      keyword  = string
      settings = optional(list(string), null)
    })

  }))
  default = []
}

variable "stateless_custom_actions" {
  description = "The custom action definitions that are available for use in the firewall policy's StatelessDefaultActions setting. You name each custom action that you define, and then you can use it by name in your default actions specifications."
  type = list(object({
    action_name = string
    dimensions  = list(string)
  }))
  default = []
}

variable "stateless_rules" {
  description = "Provide stateless rules for the rule group"
  type = list(object({
    priority = string
    actions  = list(string)
    match_attributes = object({
      protocols = list(string)
      source    = list(string)
      source_port = object({
        from_port = string
        to_port   = string
      })
      destination = list(string)
      destination_port = object({
        from_port = string
        to_port   = string
      })
      tcp_flags = optional(object({
        flags = optional(list(string), [])
        masks = optional(list(string), [])
      }), {})
    })
  }))
  default = []
}

variable "tags" {
  description = "Map of resource tags to associate with the Network Firewall resource."
  type        = map(string)
}