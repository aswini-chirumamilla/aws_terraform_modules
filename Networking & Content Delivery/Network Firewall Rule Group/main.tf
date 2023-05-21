module "network_firewall_rule_group" {

  source                          = "../../../Modules/Networking & Content Delivery/Network Firewall Rule Group"
  rule_group_name                 = var.rule_group_name
  rule_group_description          = var.rule_group_description
  rule_group_type                 = var.rule_group_type
  rule_group_capacity             = var.rule_group_capacity
  kms_key_alias_name              = var.kms_key_alias_name
  stateful_reference_sets         = var.stateful_reference_sets
  stateful_rule_options           = var.stateful_rule_options
  rules_string                    = var.rules_string
  stateful_ipset_rule_variables   = var.stateful_ipset_rule_variables
  stateful_portset_rule_variables = var.stateful_portset_rule_variables
  rules_source_list               = var.rules_source_list
  stateful_rules                  = var.stateful_rules
  stateless_custom_actions        = var.stateless_custom_actions
  stateless_rules                 = var.stateless_rules
  tags                            = var.tags

}