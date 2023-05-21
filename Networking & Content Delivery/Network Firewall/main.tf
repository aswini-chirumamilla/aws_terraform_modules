
#################################################################################
#------------------Creating AWS Network Firewall------------------#
resource "aws_networkfirewall_firewall" "network_firewall" {
  name        = var.firewall_name
  description = var.firewall_description
  dynamic "encryption_configuration" {
    for_each = var.kms_key_alias_name == null ? [] : [var.kms_key_alias_name]
    content {
      key_id = var.kms_key_alias_name == null ? null : "${data.aws_kms_key.kms_key_arn[0].arn}"
      type   = var.kms_key_alias_name == null ? "AWS_OWNED_KMS_KEY" : "CUSTOMER_KMS"
    }
  }
  firewall_policy_arn = var.firewall_policy_arn
  vpc_id              = var.firewall_vpc_id
  dynamic "subnet_mapping" {
    for_each = var.firewall_subnets
    content {
      subnet_id = subnet_mapping.value
    }
  }
  firewall_policy_change_protection = var.firewall_policy_change_protection
  subnet_change_protection          = var.firewall_subnet_change_protection
  delete_protection                 = var.firewall_delete_protection
  tags                              = var.tags
}

#------------------Fetch KMS Key ARN------------------#
data "aws_kms_key" "kms_key_arn" {
  count  = var.kms_key_alias_name != null ? 1 : 0
  key_id = "alias/${var.kms_key_alias_name}"
}