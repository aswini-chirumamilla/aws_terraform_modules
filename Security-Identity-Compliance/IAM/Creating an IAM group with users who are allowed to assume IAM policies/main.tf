#group
resource "aws_iam_group" "new_group" {
  name = var.aws_new_group
}

#adding users to group
resource "aws_iam_group_membership" "new_group" {
  count = length(var.group_users) > 0 ? 1 : 0
  group = aws_iam_group.new_group.id
  name  = aws_iam_group.new_group.name
  users = toset(data.aws_iam_user.users.*.user_name)
}

#Attaching a policy to group
resource "aws_iam_group_policy_attachment" "attach_group" {
  count      = length(var.assume_role)
  group      = aws_iam_group.new_group.name
  policy_arn = data.aws_iam_policy.custom_policy.*.arn[count.index]
}

