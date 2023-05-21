# Network Firewall Rule Group
An AWS Network Firewall rule group is a reusable set of criteria for inspecting and handling network traffic. You add one or more rule groups to a firewall policy as part of policy configuration.

## Prerequisite
* Network Firewall should be enabled in the AWS Region.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.4 |

## Resources

| Name | Type |
|------|------|
| [aws_networkfirewall_rule_group.network_firewall_rule_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |
| [aws_kms_key.kms_key_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_alias_name"></a> [kms\_key\_alias\_name](#input\_kms\_key\_alias\_name) | Provide Alias name for Customer Managed KMS Key for encryption of Network Firewall. Provide the null value for using the default AWS-managed KMS encryption. | `string` | `null` | no |
| <a name="input_rule_group_capacity"></a> [rule\_group\_capacity](#input\_rule\_group\_capacity) | TThe maximum operating resources that this rule group can use. You can't change a rule group's capacity setting after you create the rule group. When you update a rule group, you are limited to this capacity. When you reference a rule group from a firewall policy, Network Firewall reserves this capacity for the rule group. | `string` | n/a | yes |
| <a name="input_rule_group_description"></a> [rule\_group\_description](#input\_rule\_group\_description) | A description of the Network Firewall Rule Group. | `string` | n/a | yes |
| <a name="input_rule_group_name"></a> [rule\_group\_name](#input\_rule\_group\_name) | The descriptive name of the Network Firewall Rule Group. | `string` | n/a | yes |
| <a name="input_rule_group_type"></a> [rule\_group\_type](#input\_rule\_group\_type) | Provide the Rule Group type, whether the Netwwork Firewall Rule Group is STATEFUL or STATELESS. Valid values include: STATEFUL or STATELESS. | `string` | n/a | yes |
| <a name="input_rules_source_list"></a> [rules\_source\_list](#input\_rules\_source\_list) | A configuration block that defines additional settings available for Port Sets to use in the rules defined in the rule group. Can only be specified for stateful rule groups. | <pre>list(object({<br>    generated_rules_type = string<br>    target_types         = list(string)<br>    targets              = list(string)<br><br>  }))</pre> | `[]` | no |
| <a name="input_rules_string"></a> [rules\_string](#input\_rules\_string) | The fully qualified name of a file in an S3 bucket that contains Suricata compatible intrusion preventions system (IPS) rules or the Suricata rules as a string. These rules contain stateful inspection criteria and the action to take for traffic that matches the criteria. | `string` | `null` | no |
| <a name="input_stateful_ipset_rule_variables"></a> [stateful\_ipset\_rule\_variables](#input\_stateful\_ipset\_rule\_variables) | A configuration block that defines additional settings available for IP Sets to use in the rules defined in the rule group. Can only be specified for stateful rule groups. | <pre>list(object({<br>    key        = string<br>    definition = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_stateful_portset_rule_variables"></a> [stateful\_portset\_rule\_variables](#input\_stateful\_portset\_rule\_variables) | A configuration block that defines additional settings available for Port Sets to use in the rules defined in the rule group. Can only be specified for stateful rule groups. | <pre>list(object({<br>    key        = string<br>    definition = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_stateful_reference_sets"></a> [stateful\_reference\_sets](#input\_stateful\_reference\_sets) | References to the stateless rule groups that are used in the policy. These define the matching criteria in stateless rules. Priority must be set for Stateless rule groups. | <pre>list(object({<br>    key           = string<br>    reference_arn = string<br>  }))</pre> | `[]` | no |
| <a name="input_stateful_rule_options"></a> [stateful\_rule\_options](#input\_stateful\_rule\_options) | Indicates how to manage the order of the rule evaluation for the rule group. DEFAULT\_ACTION\_ORDER is the default behavior. Stateful rules are provided to the rule engine as Suricata compatible strings, and Suricata evaluates them based on certain settings | `string` | `"DEFAULT_ACTION_ORDER"` | no |
| <a name="input_stateful_rules"></a> [stateful\_rules](#input\_stateful\_rules) | A configuration block that defines additional settings available for Port Sets to use in the rules defined in the rule group. Can only be specified for stateful rule groups. | <pre>list(object({<br>    action = string<br>    header = object({<br>      protocol         = string<br>      source           = string<br>      source_port      = string<br>      destination      = string<br>      destination_port = string<br>      direction        = string<br>    })<br>    rule_option = object({<br>      keyword  = string<br>      settings = optional(list(string), null)<br>    })<br><br>  }))</pre> | `[]` | no |
| <a name="input_stateless_custom_actions"></a> [stateless\_custom\_actions](#input\_stateless\_custom\_actions) | The custom action definitions that are available for use in the firewall policy's StatelessDefaultActions setting. You name each custom action that you define, and then you can use it by name in your default actions specifications. | <pre>list(object({<br>    action_name = string<br>    dimensions  = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_stateless_rules"></a> [stateless\_rules](#input\_stateless\_rules) | Provide stateless rules for the rule group | <pre>list(object({<br>    priority = string<br>    actions  = list(string)<br>    match_attributes = object({<br>      protocols = list(string)<br>      source    = list(string)<br>      source_port = object({<br>        from_port = string<br>        to_port   = string<br>      })<br>      destination = list(string)<br>      destination_port = object({<br>        from_port = string<br>        to_port   = string<br>      })<br>      tcp_flags = optional(object({<br>        flags = optional(list(string), [])<br>        masks = optional(list(string), [])<br>      }), {})<br>    })<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of resource tags to associate with the Network Firewall resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_firewall_rule_group_arn"></a> [network\_firewall\_rule\_group\_arn](#output\_network\_firewall\_rule\_group\_arn) | AWS Network Firewall Rule Group ARN |

## Usage as Modules

| Name                                                   | Source | Version |
|--------------------------------------------------------|--------|---------|
| <a name="module_Network-Firewall-Rule-Group"></a> [Network-Firewall-Rule-Group](#module\_Network-Firewall-Rule-Group) | ../../../Modules/Networking & Content Delivery/Network Firewall Rule Group| n/a |

``` 
module "network_firewall_rule_group" {
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
    }
~~~