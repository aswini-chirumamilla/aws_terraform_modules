## Description

Terraform module to create an IAM user and attaching multiple IAM policies to the user.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.9 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_login_profile.users_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_login_profile) | resource |
| [aws_iam_user_policy_attachment.attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | About the policy | `string` | n/a | yes |
| <a name="input_enable_login_profile"></a> [enable\_login\_profile](#input\_enable\_login\_profile) | whether or not to create login\_profile. | `bool` | `false` | no |
| <a name="input_file_name"></a> [file\_name](#input\_file\_name) | Name of the files | `list(string)` | n/a | yes |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force\_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for the IAM User | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | The resource name prefix and Name tag of the IAM policy | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | Path of the policy | `string` | `"/"` | no |
| <a name="input_permissions_boundary"></a> [permissions\_boundary](#input\_permissions\_boundary) | The ARN of the policy that is used to set the permissions boundary for the user. | `string` | `""` | no |
| <a name="input_pgp_key"></a> [pgp\_key](#input\_pgp\_key) | Either a base-64 encoded PGP public key, or a keybase username in the form `keybase:username`. Used to encrypt password and access key. `pgp_key` is required when `create_iam_user_login_profile` is set to `true` | `string` | n/a | yes |
| <a name="input_policy_name"></a> [policy\_name](#input\_policy\_name) | Name of the Policy | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_Policy-ARNs"></a> [Policy-ARNs](#output\_Policy-ARNs) | ARN of the policy created |
| <a name="output_User-names"></a> [User-names](#output\_User-names) | IAM user-name |

## Modules

~~~
module "iam_user" {
  source               = "../../../../Modules/Security-Identity-Compliance/IAM/IAM USER Creation , Attaching policy and generating password"
  name                 = var.name
  path                 = var.path
  force_destroy        = var.force_destroy
  pgp_key              = var.pgp_key
  permissions_boundary = var.permissions_boundary
  tags                 = var.tags
  policy_name          = var.policy_name
  description          = var.description
  name_prefix          = var.name_prefix
  file_name            = var.file_name
}
