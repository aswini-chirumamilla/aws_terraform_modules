<!-- BEGIN_TF_DOCS -->
# <u> AWS SECRET MANAGER </u>

This module will provision a secret in AWS Secrets Manager, assign value with secret version defined, set access policy on the secret and optionally rotate the secret value if rotation lambda arn is provided.

## Prerequisite 

KMS ID : -[KMS ID tutorial](https://docs.aws.amazon.com/kms/latest/developerguide/overview.html)

Lambda : [Lambda tutorial](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets-required-permissions-function.html)

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.54.0  |
<a name="provider_terraform "></a> [Terraform](#provider\_aws) | >=1.3.9  |

## Modules


```
module "aws_secretsmanager_secret" {
  source                         = "../../../Modules/Security-Identity-Compliance/AWS-Secrets-Manager"
  secrets_name                   = var.secrets_name
  kms_key_id                     = var.kms_key_id
  description                    = var.description
  aws_secret_policy              = var.aws_secret_policy
  recovery_window_in_days        = var.recovery_window_in_days
  force_overwrite_replica_secret = var.force_overwrite_replica_secret
  tags                           = var.tags
  secret_string                  = var.secret_string
  version_stages                 = var.version_stages
  rotation_lambda_arn            = var.rotation_lambda_arn
  automatically_after_days       = var.automatically_after_days
  secret_arn                     = var.secret_arn
  block_public_policy            = var.block_public_policy
  replica_aws_region             = var.replica_aws_region
  replica_kms_key_id             = var.replica_kms_key_id
  policy                         = var.policy
}

```

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_policy) | resource |
| [aws_secretsmanager_secret_rotation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_rotation) | resource |
| [aws_secretsmanager_secret_version](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatically_after_days"></a> [automatically\_after\_days](#input\_automatically\_after\_days) | Specifies the number of days between automatic scheduled rotations of the secret. | `number` | 30 | no |
| <a name="input_aws_profile"></a> [aws\_profile](#input\_aws\_profile) | AWS\_profile | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region for AWS | `string` | n/a | yes |
| <a name="input_aws_secret_policy"></a> [aws\_secret\_policy](#input\_aws\_secret\_policy) | Valid JSON document representing a resource policy. | `string` | {} | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Makes an optional API call to Zelkova to validate the Resource Policy to prevent broad access to your secret. | `bool` | false | no |
| <a name="input_description"></a> [description](#input\_description) | Descripton of the secret | `string` | description of secret  | no |
| <a name="input_force_overwrite_replica_secret"></a> [force\_overwrite\_replica\_secret](#input\_force\_overwrite\_replica\_secret) | Accepts boolean value to specify whether to overwrite a secret with the same name in the destination Region. | `bool` | false | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret. If you don't specify this value, then Secrets Manager defaults to using the AWS account's default KMS key (the one named aws/secretsmanager). | `string` | null | no |
| <a name="input_recovery_window_in_days"></a> [recovery\_window\_in\_days](#input\_recovery\_window\_in\_days) | Number of days that AWS Secrets Manager waits before it can delete the secret | `number` | null | no |
| <a name="input_replica_aws_region"></a> [replica\_aws\_region](#input\_replica\_aws\_region) | Region for replicating the secret. | `string` | n/a | yes |
| <a name="input_replica_kms_key_id"></a> [replica\_kms\_key\_id](#input\_replica\_kms\_key\_id) | ARN, Key ID, or Alias of the AWS KMS key within the region secret is replicated to. If one is not specified, then Secrets Manager defaults to using the AWS account's default KMS key (aws/secretsmanager) in the region or creates one for use if non-existent. | `string` | aws/secretsmanager | no |
| <a name="input_rotation_lambda_arn"></a> [rotation\_lambda\_arn](#input\_rotation\_lambda\_arn) | Specifies the ARN of the Lambda function that can rotate the secret. | `string` | null | yes |
| <a name="input_secret_string"></a> [secret\_string](#input\_secret\_string) | Specifies text data that you want to encrypt and store in this version of the secret. | `string` | any string value | no |
| <a name="input_secrets_name"></a> [secrets\_name](#input\_secrets\_name) | Friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters: | `string` | any name of secret | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags which should be assigned to the Logic App Standard | `map(string)` | n/a | no |
| <a name="input_version_stages"></a> [version\_stages](#input\_version\_stages) | Specifies a list of staging labels that are attached to this version of the secret | `list` | null | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secret_ARN"></a> [secret\_ARN](#output\_secret\_ARN) | The ARN of secret manager |
<!-- END_TF_DOCS -->
