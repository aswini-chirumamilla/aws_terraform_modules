module "security_group" {
  source                 = "../../../Modules/Networking & Content Delivery/SecurityGroup"
  security_group_name    = var.security_group_name
  sg_description         = var.sg_description
  sg_vpcid               = var.sg_vpcid
  revoke_rules_on_delete = var.revoke_rules_on_delete
  sg_tags                = var.sg_tags
  sg_egress              = var.sg_egress
  sg_ingress             = var.sg_ingress
  name_prefix            = var.name_prefix
}