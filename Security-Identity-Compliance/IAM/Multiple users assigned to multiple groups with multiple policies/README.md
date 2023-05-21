## Description

Terraform module to create Multiple users assigned to multiple groups with multiple policies.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.49 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.49.2 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.group_membership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.group_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_groups"></a> [groups](#input\_groups) | Names of aws\_groups | `list(string)` | <pre>[<br>  "group0",<br>  "group1"<br>]</pre> | no |
| <a name="input_profile"></a> [profile](#input\_profile) | Name of profile | `string` | `"Profile-1"` | no |
| <a name="input_region"></a> [region](#input\_region) | Name of region | `string` | `"ap-south-1"` | no |
| <a name="input_users"></a> [users](#input\_users) | Names of aws\_users | `list(string)` | <pre>[<br>  "user0",<br>  "user1",<br>  "user2",<br>  "user3"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_names"></a> [group\_names](#output\_group\_names) | Name of the Group created |
| <a name="output_policy_names"></a> [policy\_names](#output\_policy\_names) | Name of the policies created |
| <a name="output_user_names"></a> [user\_names](#output\_user\_names) | Name of the users created |
