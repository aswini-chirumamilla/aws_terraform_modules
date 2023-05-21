locals {
  stateful_rule_option = (var.rule_group_type == "STATELESS") ? null : var.stateful_rule_options
  rulevariable         = (var.stateful_ipset_rule_variables != [] || var.stateful_portset_rule_variables != []) ? ["rule_variable_block"] : []
  stateless_block      = var.rule_group_type == "STATELESS" ? ["stateless_block"] : []
}
#################################################################################
#------------------Creating AWS Network Firewall Rule Group------------------#
resource "aws_networkfirewall_rule_group" "network_firewall_rule_group" {
  name        = var.rule_group_name
  description = var.rule_group_description
  type        = var.rule_group_type
  capacity    = var.rule_group_capacity
  dynamic "encryption_configuration" {
    for_each = var.kms_key_alias_name == null ? [] : [var.kms_key_alias_name]
    content {
      key_id = var.kms_key_alias_name == null ? null : "${data.aws_kms_key.kms_key_arn[0].arn}"
      type   = var.kms_key_alias_name == null ? "AWS_OWNED_KMS_KEY" : "CUSTOMER_KMS"
    }
  }
  rule_group {
    dynamic "stateful_rule_options" {
      for_each = local.stateful_rule_option == null ? [] : [local.stateful_rule_option]
      content {
        rule_order = local.stateful_rule_option
      }
    }
    rules_source {
      rules_string = var.rules_string
      dynamic "rules_source_list" {
        for_each = var.rules_source_list
        iterator = rulesource
        content {
          generated_rules_type = lookup(rulesource.value, "generated_rules_type")
          target_types         = lookup(rulesource.value, "target_types")
          targets              = lookup(rulesource.value, "targets")
        }
      }
      dynamic "stateful_rule" {
        for_each = var.stateful_rules
        content {
          action = lookup(stateful_rule.value, "action")
          dynamic "header" {
            for_each = [stateful_rule.value.header]
            content {
              protocol         = lookup(header.value, "protocol")
              source           = lookup(header.value, "source")
              source_port      = lookup(header.value, "source_port")
              destination      = lookup(header.value, "destination")
              destination_port = lookup(header.value, "destination_port")
              direction        = lookup(header.value, "direction")
            }
          }
          dynamic "rule_option" {
            for_each = [stateful_rule.value.rule_option]
            content {
              keyword  = lookup(rule_option.value, "keyword")
              settings = lookup(rule_option.value, "settings")
            }
          }
        }
      }
      dynamic "stateless_rules_and_custom_actions" {
        for_each = local.stateless_block
        content {
          dynamic "stateless_rule" {
            for_each = var.stateless_rules
            content {
              priority = lookup(stateless_rule.value, "priority")
              rule_definition {
                actions = lookup(stateless_rule.value, "actions")
                dynamic "match_attributes" {
                  for_each = [lookup(stateless_rule.value, "match_attributes")]
                  content {
                    protocols = lookup(match_attributes.value, "protocols")
                    dynamic "source" {
                      for_each = lookup(match_attributes.value, "source")
                      content {
                        address_definition = source.value
                      }
                    }
                    dynamic "source_port" {
                      for_each = [lookup(match_attributes.value, "source_port")]
                      content {
                        from_port = lookup(source_port.value, "from_port")
                        to_port   = lookup(source_port.value, "to_port")
                      }
                    }
                    dynamic "destination" {
                      for_each = lookup(match_attributes.value, "destination")
                      content {
                        address_definition = destination.value
                      }
                    }
                    dynamic "destination_port" {
                      for_each = [lookup(match_attributes.value, "destination_port")]
                      content {
                        from_port = lookup(destination_port.value, "from_port")
                        to_port   = lookup(destination_port.value, "to_port")
                      }
                    }
                    dynamic "tcp_flag" {
                      for_each = [lookup(match_attributes.value, "tcp_flags")] #== null ? [] : [lookup(match_attributes.value, "tcp_flags")]
                      content {
                        flags = lookup(tcp_flag.value, "flags")
                        masks = lookup(tcp_flag.value, "masks")
                      }
                    }
                  }
                }
              }
            }
          }
          dynamic "custom_action" {
            for_each = var.stateless_custom_actions
            content {
              action_definition {
                publish_metric_action {
                  dynamic "dimension" {
                    for_each = lookup(custom_action.value, "dimensions")
                    iterator = dim
                    content {
                      value = dim.value
                    }
                  }
                }
              }
              action_name = lookup(custom_action.value, "action_name")
            }
          }
        }
      }
    }
    reference_sets {
      dynamic "ip_set_references" {
        for_each = var.stateful_reference_sets
        iterator = reference_sets
        content {
          key = lookup(reference_sets.value, "key")
          ip_set_reference {
            reference_arn = lookup(reference_sets.value, "reference_arn")
          }
        }
      }
    }
    dynamic "rule_variables" {
      for_each = local.rulevariable
      content {
        dynamic "ip_sets" {
          for_each = var.stateful_ipset_rule_variables
          iterator = rulevariables
          content {
            key = lookup(rulevariables.value, "key")
            ip_set {
              definition = lookup(rulevariables.value, "definition")
            }
          }
        }
        dynamic "port_sets" {
          for_each = var.stateful_portset_rule_variables
          iterator = ports
          content {
            key = lookup(ports.value, "key")
            port_set {
              definition = lookup(ports.value, "definition")
            }
          }
        }
      }
    }
  }
  tags = var.tags
}