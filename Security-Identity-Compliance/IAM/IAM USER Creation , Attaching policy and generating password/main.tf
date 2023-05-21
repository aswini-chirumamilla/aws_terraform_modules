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