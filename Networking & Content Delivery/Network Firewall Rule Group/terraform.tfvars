rule_group_name                 = "test-rule-group-stateful"
rule_group_description          = "This is a Test Network Firewall Rule Group"
rule_group_type                 = "STATEFUL"
rule_group_capacity             = "2000"
kms_key_alias_name              = "test-network-firewall"
rules_string                    = null
stateful_rule_options           = "DEFAULT_ACTION_ORDER"
stateful_reference_sets         = [{ "key" = "IP_SET_SET01", "reference_arn" = "arn:aws:ec2:us-east-2:aws:prefix-list/pl-4ca54025" }]
stateful_portset_rule_variables = [{ "key" = "HTTP_PORT", "definition" = ["80"] }]
stateful_ipset_rule_variables   = [{ "key" = "HOME_NET", "definition" = ["10.0.0.0/24", "10.1.0.0/24"] }]
rules_source_list               = []
stateful_rules                  = [{ "action" = "DROP", "header" = { "protocol" = "SSH", "source" = "ANY", "source_port" = "22", "destination" = "ANY", "destination_port" = "22", "direction" = "ANY" }, "rule_option" = { "keyword" = "sid:1" } }]
stateless_custom_actions        = []
stateless_rules                 = []
tags                            = { "environment" = "Test", "Project" = "Testing" }