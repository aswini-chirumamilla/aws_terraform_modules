#Creating AWS_IAM_USERS
resource "aws_iam_user" "user" {
  count = length(var.users)
  name = "user-${count.index}"
}

#Creating AWS_IAM_GROUPS
resource "aws_iam_group" "group" {
 count = length(var.groups)
  name = "group-${count.index}"
}

#Creating AWS_IAM_GROUP_MEMBERSHIP
resource "aws_iam_group_membership" "group_membership" {
  count = length(var.users)
  name = "${element(aws_iam_user.user.*.name, count.index)}"
  users = ["${element(aws_iam_user.user.*.name, count.index)}"]
  group = "${element(aws_iam_group.group.*.name, count.index % 2)}"
}

#Creating AWS_IAM_POLICY
resource "aws_iam_policy" "policy" {
  count = length(var.groups)
  name = "policy-${count.index}"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = ["s3:*"],
        Effect = "Allow",
        Resource = "*"
      }
    ]
  })
}

#Creating AWS_IAM_GROUP_POLICY_ATTACHMENT
resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
  count = length(var.groups)
  group = "${element(aws_iam_group.group.*.name, count.index)}"
  policy_arn = "${element(aws_iam_policy.policy.*.arn, count.index)}"
}