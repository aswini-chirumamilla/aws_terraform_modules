## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_networkfirewall_firewall_policy.network_firewall_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall_policy) | resource |
| [aws_kms_key.kms_key_arn](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_policy_description"></a> [firewall\_policy\_description](#input\_firewall\_policy\_description) | A description of the firewall policy | `string` | n/a | yes |
| <a name="input_firewall_policy_name"></a> [firewall\_policy\_name](#input\_firewall\_policy\_name) | A descriptive name of the firewall policy | `string` | n/a | yes |
| <a name="input_kms_key_alias_name"></a> [kms\_key\_alias\_name](#input\_kms\_key\_alias\_name) | Provide Alias name for Customer Managed KMS Key for encryption of Network Firewall. Provide the null value for using the default AWS-managed KMS encryption. | `string` | `null` | no |
| <a name="input_stateful_default_actions"></a> [stateful\_default\_actions](#input\_stateful\_default\_actions) | The default actions to take on a packet that doesn't match any stateful rules. The stateful default action is optional, but must be provided when using the strict rule order. Also, all the AWS Managed rule groups have RuleOrder as DEFAULT\_ACTION\_ORDER | `list(string)` | `[]` | no |
| <a name="input_stateful_engine_options_ruleorder"></a> [stateful\_engine\_options\_ruleorder](#input\_stateful\_engine\_options\_ruleorder) | Additional options governing how Network Firewall handles stateful rules. The stateful rule groups that you use in your policy must have stateful rule options settings that are compatible with these settings. The rule groups included for the policy must have the Rule Order as STRICT\_ORDER. Also, AWS Managed rule groups do not support STRICT\_ORDER. | `string` | `null` | no |
| <a name="input_stateful_rule_group_references"></a> [stateful\_rule\_group\_references](#input\_stateful\_rule\_group\_references) | References to the stateful rule groups that are used in the policy. These define the inspection criteria in stateful rules. Priority must be provided if stateful\_engine\_options\_ruleorder is passed as STRICT\_ORDER. | <pre>list(object({<br>    priority                        = optional(string, null)<br>    stateful_rulegroup_resource_arn = string<br>    override                        = optional(string, null)<br>  }))</pre> | `[]` | no |
| <a name="input_stateless_custom_actions"></a> [stateless\_custom\_actions](#input\_stateless\_custom\_actions) | The custom action definitions that are available for use in the firewall policy's StatelessDefaultActions setting. You name each custom action that you define, and then you can use it by name in your default actions specifications. | <pre>list(object({<br>    action_name = string<br>    dimensions  = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_stateless_default_actions"></a> [stateless\_default\_actions](#input\_stateless\_default\_actions) | The actions to take on a packet if it doesn't match any of the stateless rules in the policy | `list(string)` | n/a | yes |
| <a name="input_stateless_fragment_default_actions"></a> [stateless\_fragment\_default\_actions](#input\_stateless\_fragment\_default\_actions) | The actions to take on a fragmented packet if it doesn't match any of the stateless rules in the policy | `list(string)` | n/a | yes |
| <a name="input_stateless_rule_group_references"></a> [stateless\_rule\_group\_references](#input\_stateless\_rule\_group\_references) | References to the stateless rule groups that are used in the policy. These define the matching criteria in stateless rules. Priority must be set for Stateless rule groups. | <pre>list(object({<br>    priority                         = string<br>    stateless_rulegroup_resource_arn = string<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of resource tags to associate with the Network Firewall Policy resource. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_firewall_policy_arn"></a> [network\_firewall\_policy\_arn](#output\_network\_firewall\_policy\_arn) | AWS Network Firewall Policy ARN |
