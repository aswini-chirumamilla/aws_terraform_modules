#Deploys the secrets manager secret resource to set metadata

resource "aws_secretsmanager_secret" "aws_secret" {
  name = var.secrets_name
  /* name_prefix                 = var.name_prefix */ # conflicts with secret name
  kms_key_id                     = var.kms_key_id
  description                    = var.description
  policy                         = var.aws_secret_policy
  recovery_window_in_days        = var.recovery_window_in_days
  force_overwrite_replica_secret = var.force_overwrite_replica_secret
  tags                           = var.tags

  dynamic "replica" {
    for_each = var.replica_kms_key_id != null && var.replica_aws_region != null ? [1] : []
    content {
      kms_key_id = var.replica_kms_key_id
      region     = var.replica_aws_region
    }
  }
}

# Provides a resource to manage AWS Secrets Manager secret version including its secret value

resource "aws_secretsmanager_secret_version" "aws_secret_version" {
  secret_id     = aws_secretsmanager_secret.aws_secret.id
  secret_string = var.secret_string
  /* secret_binary  = var.secret_binary     # */ # Conflicts with secret string
  version_stages = var.version_stages

}

# Provides a resource to manage AWS Secrets Manager secret rotation. To manage a secret

resource "aws_secretsmanager_secret_rotation" "aws_secret_rotation" {
  count               = var.rotation_lambda_arn != null ? 1 : 0
  secret_id           = aws_secretsmanager_secret.aws_secret.id
  rotation_lambda_arn = var.rotation_lambda_arn
  rotation_rules {
    automatically_after_days = var.automatically_after_days
  }
}

# Provides a resource to manage AWS Secrets Manager secret policy.

resource "aws_secretsmanager_secret_policy" "aws_secret_policy" {
  secret_arn          = aws_secretsmanager_secret.aws_secret.arn
  block_public_policy = var.block_public_policy
  policy              = file("policy.json")
}

######################################################
