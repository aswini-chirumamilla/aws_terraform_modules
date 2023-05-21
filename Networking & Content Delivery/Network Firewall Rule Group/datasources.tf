#------------------Fetch KMS Key ARN------------------#
data "aws_kms_key" "kms_key_arn" {
  count  = var.kms_key_alias_name != null ? 1 : 0
  key_id = "alias/${var.kms_key_alias_name}"
}