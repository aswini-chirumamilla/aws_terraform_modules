module "aws_secretsmanager_secret_version" {
  source                         = "../../../../Modules/Security-Identity-Compliance/AWS-Secrets-Manager"
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
  block_public_policy            = var.block_public_policy
  replica_aws_region             = var.replica_aws_region
  replica_kms_key_id             = var.replica_kms_key_id
  policy                         = var.policy
}

