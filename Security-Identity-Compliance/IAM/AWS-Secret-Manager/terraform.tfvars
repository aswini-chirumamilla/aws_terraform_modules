aws_region                     = "us-east-1"
aws_profile                    = "terraform"
secrets_name                   = "Rotation-name-secret"
kms_key_id                     = "arn:aws:kms:us-east-1:239312700453:key/87e3495b-0b51-4905-99cd-905af97342ae"
description                    = "This is description for Secret manager"
policy                         = "policy.json"
recovery_window_in_days        = 0
force_overwrite_replica_secret = false
replica_aws_region             = "us-west-1"
replica_kms_key_id             = "aws/secretsmanager"
secret_string                  = "This is secret string "
rotation_lambda_arn            = "arn:aws:lambda:us-east-1:239312700453:function:rotation-secrets"
automatically_after_days       = 30
block_public_policy            = false
tags = {
  "env" : "prod"
}
/* name_prefix                    = "Prfix" */        # conflicts with secrets name variable
/* secret_binary                  = "secret-binary"*/ # conflicts with secret string



