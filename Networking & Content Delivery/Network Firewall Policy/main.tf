module "network_firewall_policy" {

  source                             = "../../../Modules/Networking & Content Delivery/Network Firewall Policy"
  firewall_policy_name               = var.firewall_policy_name
  firewall_policy_description        = var.firewall_policy_description
  kms_key_alias_name                 = var.kms_key_alias_name
  stateless_fragment_default_actions = var.stateless_fragment_default_actions
  stateless_default_actions          = var.stateless_default_actions
  stateless_rule_group_references    = var.stateless_rule_group_references
  stateless_custom_actions           = var.stateless_custom_actions
  stateful_rule_group_references     = var.stateful_rule_group_references
  stateful_default_actions           = var.stateful_default_actions
  stateful_engine_options_ruleorder  = var.stateful_engine_options_ruleorder
  tags                               = var.tags

}