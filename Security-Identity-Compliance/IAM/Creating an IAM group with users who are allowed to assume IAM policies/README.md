## Description

Terraform module to create an IAM Group with Users who are allowed to assume IAM Policies.

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
| [aws_iam_group.new_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.new_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.attach_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_iam_user.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role"></a> [assume\_role](#input\_assume\_role) | List of IAM roles ARNs which can be assumed by the group | `list(string)` | n/a | yes |
| <a name="input_aws_new_group"></a> [aws\_new\_group](#input\_aws\_new\_group) | Aws new user | `string` | `"Developers"` | no |
| <a name="input_group_users"></a> [group\_users](#input\_group\_users) | List of IAM users to have in an IAM group which can assumed the role | `list(string)` | <pre>[<br>  "user-1"<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the IAM User | `list(string)` | n/a | yes |
| <a name="input_usercount"></a> [usercount](#input\_usercount) | no of users | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_arn"></a> [group\_arn](#output\_group\_arn) | ARN of the Group created |
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | Name of the Group created |
| <a name="output_policy_arn"></a> [policy\_arn](#output\_policy\_arn) | ARN of the policy created |

Usage as Modules

| Name | Source | 
|------|--------|
|IAM| 
|../../../../Modules/Security-Identity-Compliance/IAM/creating an IAM Group with Users who are allowed to assume IAM Policies|

```
module "iam_group" {
  source        = "../../../../Modules/Security-Identity-Compliance/IAM/Creating an IAM group with users who are allowed to assume IAM policies"
  name          = var.name
  aws_new_group = var.aws_new_group
  group_users   = var.group_users
  assume_role   = var.assume_role
  usercount     = 1
}
```


