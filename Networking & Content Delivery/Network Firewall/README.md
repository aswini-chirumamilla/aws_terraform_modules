# Network Firewall
AWS Network Firewall is a stateful, managed, network firewall and intrusion detection and prevention service for your virtual private cloud (VPC) that you created in Amazon Virtual Private Cloud (Amazon VPC).

## Prerequisite
* A VPC along with subnets in different Availability Zones should exist
* Network Firewall Policy with associated Stateless/Stateful rule groups should already exist

## Requirements

| Name | Version   |
|------|-----------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4    |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_networkfirewall_firewall.network_firewall](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_delete_protection"></a> [firewall\_delete\_protection](#input\_firewall\_delete\_protection) | A flag indicating whether it is possible to delete the firewall. A setting of TRUE indicates that the firewall is protected against deletion. Use this setting to protect against accidentally deleting a firewall that is in use. | `bool` | `true` | no |
| <a name="input_firewall_description"></a> [firewall\_description](#input\_firewall\_description) | A description of the Network Firewall. | `string` | n/a | yes |
| <a name="input_firewall_name"></a> [firewall\_name](#input\_firewall\_name) | The descriptive name of the Network Firewall. | `string` | n/a | yes |
| <a name="input_firewall_policy_arn"></a> [firewall\_policy\_arn](#input\_firewall\_policy\_arn) | The Amazon Resource Name (ARN) of the firewall policy. The relationship of firewall to firewall policy is many to one. Each firewall requires one firewall policy association, and you can use the same firewall policy for multiple firewalls. | `string` | n/a | yes |
| <a name="input_firewall_policy_change_protection"></a> [firewall\_policy\_change\_protection](#input\_firewall\_policy\_change\_protection) | A setting indicating whether the firewall is protected against a change to the firewall policy association. Use this setting to protect against accidentally modifying the firewall policy for a firewall that is in use. | `bool` | `true` | no |
| <a name="input_firewall_subnet_change_protection"></a> [firewall\_subnet\_change\_protection](#input\_firewall\_subnet\_change\_protection) | A setting indicating whether the firewall is protected against changes to the subnet associations. Use this setting to protect against accidentally modifying the subnet associations for a firewall that is in use. | `bool` | `true` | no |
| <a name="input_firewall_subnets"></a> [firewall\_subnets](#input\_firewall\_subnets) | Set of configuration blocks describing the public subnets. Each subnet must belong to a different Availability Zone in the VPC. AWS Network Firewall creates a firewall endpoint in each subnet. | `list` | n/a | yes |
| <a name="input_firewall_vpc_id"></a> [firewall\_vpc\_id](#input\_firewall\_vpc\_id) | The unique identifier of the VPC where AWS Network Firewall should create the firewall. | `string` | n/a | yes |
| <a name="input_kms_key_alias_name"></a> [kms\_key\_alias\_name](#input\_kms\_key\_alias\_name) | Provide Alias name for Customer Managed KMS Key for encryption of Network Firewall. Provide the null value for using the default AWS-managed KMS encryption. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Map of resource tags to associate with the Network Firewall Policy resource. | `map(string)` | <pre>{<br>  "Project": "Testing",<br>  "environment": "Test"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_firewall_arn"></a> [network\_firewall\_arn](#output\_network\_firewall\_arn) | AWS Network Firewall ARN |

## Usage as Modules

| Name                                                   | Source | Version |
|--------------------------------------------------------|--------|---------|
| <a name="module_Network-Firewall"></a> [Network-Firewall](#module\_Network-Firewall) | ../../../Modules/Networking & Content Delivery/Network Firewall | n/a |

``` 
module "network_firewall" {
    aws_region                         = "us-east-2"
    aws_profile                        = "terraform"
    firewall_description               = "This is a test Network Firewall"
    firewall_name                      = "test-firewall"
    kms_key_alias_name                 = "test_key01"
    firewall_policy_arn                = "arn:aws:network-firewall:us-east-2:239312700453:firewall-policy/test-firewall-policy"
    firewall_subnets                   = ["subnet-09d22a50392539dc1","subnet-034e2f7e53d047c49","subnet-002df92bd01041dfc"]
    tags                               = { "environment" = "Test", "Project" = "Testing" }
    }
~~~
