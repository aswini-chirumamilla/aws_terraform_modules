module "iam_group" {
  source        = "../../../../Modules/Security-Identity-Compliance/IAM/Creating an IAM group with users who are allowed to assume IAM policies"
  name          = var.name
  aws_new_group = var.aws_new_group
  group_users   = var.group_users
  assume_role   = var.assume_role
  usercount     = 1
}