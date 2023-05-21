data "aws_iam_user" "users" {
  count     = var.usercount
  user_name = var.name[count.index]
}

data "aws_iam_policy" "custom_policy" {
  count = length(var.assume_role)
  name  = var.assume_role[count.index]
}