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

# AWS Network Firewall Policy resource Variables
variable "firewall_policy_name" {
  description = "A descriptive name of the firewall policy"
  type        = string
}

variable "firewall_policy_description" {
  description = "A description of the firewall policy"
  type        = string
}

variable "kms_key_alias_name" {
  description = "Provide Alias name for Customer Managed KMS Key for encryption of Network Firewall. Provide the null value for using the default AWS-managed KMS encryption."
  type        = string
  default     = null
}

variable "stateless_rule_group_references" {
  description = "References to the stateless rule groups that are used in the policy. These define the matching criteria in stateless rules. Priority must be set for Stateless rule groups."
  type = list(object({
    priority                         = string
    stateless_rulegroup_resource_arn = string
  }))
  default = []
}

variable "stateful_rule_group_references" {
  description = "References to the stateful rule groups that are used in the policy. These define the inspection criteria in stateful rules. Priority must be provided if stateful_engine_options_ruleorder is passed as STRICT_ORDER."
  type = list(object({
    priority                        = optional(string, null)
    stateful_rulegroup_resource_arn = string
    override                        = optional(string, null)
  }))
  default = []
}

variable "stateful_default_actions" {
  description = "The default actions to take on a packet that doesn't match any stateful rules. The stateful default action is optional, but must be provided when using the strict rule order."
  type        = list(string)
  default     = []
}

variable "stateful_engine_options_ruleorder" {
  description = "Additional options governing how Network Firewall handles stateful rules. The stateful rule groups that you use in your policy must have stateful rule options settings that are compatible with these settings. The rule groups included for the policy must have the Rule Order as STRICT_ORDER. Also, AWS Managed rule groups do not support STRICT_ORDER."
  type        = string
  default     = null
}

variable "stateless_default_actions" {
  description = "The actions to take on a packet if it doesn't match any of the stateless rules in the policy"
  type        = list(string)
}

variable "stateless_fragment_default_actions" {
  description = "The actions to take on a fragmented packet if it doesn't match any of the stateless rules in the policy"
  type        = list(string)
}

variable "stateless_custom_actions" {
  description = "The custom action definitions that are available for use in the firewall policy's StatelessDefaultActions setting. You name each custom action that you define, and then you can use it by name in your default actions specifications."
  type = list(object({
    action_name = string
    dimensions  = list(string)
  }))
  default = []
}

variable "tags" {
  description = "Map of resource tags to associate with the Network Firewall Policy resource."
  type        = map(string)
}