## Variable for aws secretsmanager

variable "kms_key_id" {
  type        = string
  description = "ARN or Id of the AWS KMS key to be used to encrypt the secret values in the versions stored in this secret. If you don't specify this value, then Secrets Manager defaults to using the AWS account's default KMS key (the one named aws/secretsmanager)."
  default     = null
}

variable "description" {
  type        = string
  description = "Descripton of the secret"
  default     = null
}

variable "replica_kms_key_id" {
  type        = string
  description = "ARN, Key ID, or Alias of the AWS KMS key within the region secret is replicated to. If one is not specified, then Secrets Manager defaults to using the AWS account's default KMS key (aws/secretsmanager) in the region or creates one for use if non-existent."
  default     = null
}

variable "replica_aws_region" {
  type        = string
  description = "Region for replicating the secret."
}

variable "secrets_name" {
  type        = string
  description = "Friendly name of the new secret. The secret name can consist of uppercase letters, lowercase letters, digits, and any of the following characters:"
  default     = null
}

# Conflicts with name so commented out

/* variable "name_prefix" {
    type = string
    description = " Creates a unique name beginning with the specified prefix"
    default = null
} */

variable "aws_secret_policy" {
  type        = string
  description = " Valid JSON document representing a resource policy."
  default     = "{}"
}

variable "recovery_window_in_days" {
  type        = number
  description = " Number of days that AWS Secrets Manager waits before it can delete the secret."
  default     = null
}

variable "force_overwrite_replica_secret" {
  type        = bool
  description = "Accepts boolean value to specify whether to overwrite a secret with the same name in the destination Region."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags which should be assigned to the Logic App Standard"
}

## Variable for aws secret manager version

variable "secret_string" {
  type        = string
  description = "Specifies text data that you want to encrypt and store in this version of the secret."
}

# Conflicts with secret string so commented out 

/* variable "secret_binary" {
    type = string
    description = "Specifies binary data that you want to encrypt and store in this version of the secret. "
} */

variable "version_stages" {
  type        = list(string)
  description = "Specifies a list of staging labels that are attached to this version of the secret"
  default     = null
}

# AWS Secrets Manager secret rotation. To manage a secret

variable "rotation_lambda_arn" {
  type        = string
  description = "Specifies the ARN of the Lambda function that can rotate the secret."
  default     = null
}

variable "automatically_after_days" {
  type        = number
  description = "Specifies the number of days between automatic scheduled rotations of the secret."
  default     = null
}

# AWS Secrets Manager secret policy.

variable "block_public_policy" {
  type        = bool
  description = "Makes an optional API call to Zelkova to validate the Resource Policy to prevent broad access to your secret."
  default     = null
}

variable "policy" {
  type        = string
  description = "Valid JSON document representing a resource policy. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide. Unlike aws_secretsmanager_secret, where policy can be set to {} to delete the policy, {} is not a valid policy since policy is required."
}
