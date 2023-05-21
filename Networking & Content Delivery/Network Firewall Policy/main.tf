
#################################################################################
#------------------Creating AWS Network Firewall Policy------------------#
resource "aws_networkfirewall_firewall_policy" "network_firewall_policy" {
  name        = var.firewall_policy_name
  description = var.firewall_policy_description
  dynamic "encryption_configuration" {
    for_each = var.kms_key_alias_name == null ? [] : [var.kms_key_alias_name]
    content {
      key_id = var.kms_key_alias_name == null ? null : "${data.aws_kms_key.kms_key_arn[0].arn}"
      type   = var.kms_key_alias_name == null ? "AWS_OWNED_KMS_KEY" : "CUSTOMER_KMS"
    }
  }

  firewall_policy {
    stateless_default_actions          = var.stateless_default_actions
    stateless_fragment_default_actions = var.stateless_fragment_default_actions
    stateful_default_actions           = var.stateful_default_actions
    dynamic "stateful_engine_options" {
      for_each = var.stateful_engine_options_ruleorder == null ? [] : [var.stateful_engine_options_ruleorder]
      content {
        rule_order = var.stateful_engine_options_ruleorder == null ? null : var.stateful_engine_options_ruleorder
      }
    }
    dynamic "stateless_custom_action" {
      for_each = var.stateless_custom_actions
      content {
        action_definition {
          publish_metric_action {
            dynamic "dimension" {
              for_each = stateless_custom_action.value.dimensions
              iterator = dim
              content {
                value = dim.value
              }
            }
          }
        }
        action_name = lookup(stateless_custom_action.value, "action_name")
      }
    }
    dynamic "stateless_rule_group_reference" {
      for_each = var.stateless_rule_group_references
      iterator = rule
      content {
        priority     = lookup(rule.value, "priority")
        resource_arn = lookup(rule.value, "stateless_rulegroup_resource_arn")
      }
    }

    dynamic "stateful_rule_group_reference" {
      for_each = var.stateful_rule_group_references
      iterator = rule
      content {
        priority     = lookup(rule.value, "priority") == null ? null : lookup(rule.value, "priority")
        resource_arn = lookup(rule.value, "stateful_rulegroup_resource_arn")
        dynamic "override" {
          for_each = lookup(rule.value, "override") == null ? [] : [lookup(rule.value, "override")]
          content {
            action = lookup(rule.value, "override") == null ? null : lookup(rule.value, "override")
          }
        }
      }
    }
  }

  tags = var.tags
}

#------------------Fetch KMS Key ARN------------------#
data "aws_kms_key" "kms_key_arn" {
  count  = var.kms_key_alias_name != null ? 1 : 0
  key_id = "alias/${var.kms_key_alias_name}"
}