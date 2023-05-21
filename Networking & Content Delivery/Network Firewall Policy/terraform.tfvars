aws_region                         = "us-east-2"
aws_profile                        = "terraform"
firewall_policy_description        = "ThisisaTestPolicy"
firewall_policy_name               = "test-firewall-policy"
kms_key_alias_name                 = "test_key01"
stateless_fragment_default_actions = ["aws:pass"]
stateless_default_actions          = ["aws:drop"]
stateful_rule_group_references     = [{ "stateful_rulegroup_resource_arn" = "arn:aws:network-firewall:us-east-2:239312700453:stateful-rulegroup/TestRuleGroup" }]
stateless_rule_group_references    = []
stateful_engine_options_ruleorder  = "DEFAULT_ACTION_ORDER"
tags                               = { "environment" = "Test", "Project" = "Testing" }