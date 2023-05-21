#Create an IAM user 
resource "aws_iam_user" "users" {
  name                 = var.name
  path                 = var.path
  force_destroy        = var.force_destroy
  permissions_boundary = var.permissions_boundary
  tags                 = var.tags
}

#Manage the created IAM user with encrypted password generated
resource "aws_iam_user_login_profile" "users_profile" {
  count   = var.enable_login_profile ? 1 : 0
  user    = aws_iam_user.users.name
  pgp_key = var.pgp_key
}

# Create an IAM Policy
resource "aws_iam_policy" "custom_policy" {
  count       = length(var.file_name)
  name        = var.file_name[count.index]
  description = var.description
  path        = var.path
  name_prefix = var.name_prefix
  tags        = var.tags
  policy      = file("${var.file_name[count.index]}.json")
}

#Attaching a policy to user
resource "aws_iam_user_policy_attachment" "attachment" {
  count      = length(var.file_name)
  user       = aws_iam_user.users.name
  policy_arn = aws_iam_policy.custom_policy[count.index].arn
}