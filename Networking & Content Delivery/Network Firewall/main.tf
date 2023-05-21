module "network_firewall" {

  source                            = "../../../Modules/Networking & Content Delivery/Network Firewall"
  firewall_name                     = var.firewall_name
  firewall_description              = var.firewall_description
  kms_key_alias_name                = var.kms_key_alias_name
  firewall_policy_arn               = var.firewall_policy_arn
  firewall_vpc_id                   = var.firewall_vpc_id
  firewall_subnets                  = var.firewall_subnets
  firewall_policy_change_protection = var.firewall_policy_change_protection
  firewall_subnet_change_protection = var.firewall_subnet_change_protection
  firewall_delete_protection        = var.firewall_delete_protection
  tags                              = var.tags

}