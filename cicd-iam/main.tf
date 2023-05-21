resource "aws_iam_role" "tf_spring_build_role" {                           # RESOURCE IAM ROLE
  name = "${var.project}-devops-${var.region}-codebuild-springbuild"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "tf_spring_build_policy" {                # RESOURCE IAM ROLE'S POLICY
  role = aws_iam_role.tf_spring_build_role.name
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "codecommit:ListBranches",
                "codecommit:ListRepositories",
                "codecommit:BatchGetRepositories",
                "codecommit:Get*",
                "codecommit:GitPull"
            ],
            "Resource": [
                "arn:aws:codecommit:${var.region}:${var.account}:*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "iam:Get*",
                "iam:List*",
                "logs:Describe*",
                "logs:Get*",
                "tag:Get*"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ecr:*"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "secretsmanager:GetSecretValue"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:${var.region}:${var.account}:log-group:/aws/codebuild/*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${var.project}*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "codeartifact:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "sts:GetServiceBearerToken",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "sts:AWSServiceName": "codeartifact.amazonaws.com"
                }
            }
        },
        {
            "Effect": "Allow",
            "Action": [
                "kms:*",
                "iam:ListUsers",
                "iam:ListRoles"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_iam_role" "tf_pipeline_role" {                           # RESOURCE IAM ROLE
  name = "${var.project}-devops-${var.region}-codepipeline-buildnk8sdeploy"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "tf_pipeline_policy" {                # RESOURCE IAM ROLE'S POLICY
  role = aws_iam_role.tf_pipeline_role.name
  policy = <<POLICY
{
    "Statement": [
        {
            "Action": [
                "codecommit:CancelUploadArchive",
                "codecommit:GetBranch",
                "codecommit:GetCommit",
                "codecommit:GetUploadArchiveStatus",
                "codecommit:UploadArchive"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "codedeploy:CreateDeployment",
                "codedeploy:GetApplication",
                "codedeploy:GetApplicationRevision",
                "codedeploy:GetDeployment",
                "codedeploy:GetDeploymentConfig",
                "codedeploy:RegisterApplicationRevision"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "codestar-connections:UseConnection"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "cloudwatch:*",
                "s3:*",
                "sns:*"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Action": [
                "codebuild:BatchGetBuilds",
                "codebuild:StartBuild"
            ],
            "Resource": "*",
            "Effect": "Allow"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecr:DescribeImages"
            ],
            "Resource": "*"
        }
    ],
    "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_role" "tf_k8s_deploy_role" {                           # RESOURCE IAM ROLE
  name = "${var.project}-devops-${var.region}-codebuild-springdeploy"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codebuild.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "tf_k8s_deploy_policy" {                # RESOURCE IAM ROLE'S POLICY
  role = aws_iam_role.tf_k8s_deploy_role.name
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "codecommit:ListBranches",
                "codecommit:ListRepositories",
                "codecommit:BatchGetRepositories",
                "codecommit:Get*",
                "codecommit:GitPull"
            ],
            "Resource": [
                "arn:aws:codecommit:${var.region}:${var.account}:*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "iam:Get*",
                "iam:List*",
                "logs:Describe*",
                "logs:Get*",
                "tag:Get*"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "ecr:*"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "secretsmanager:GetSecretValue"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "logs:CreateLogGroup",
                "logs:CreateLogStream",
                "logs:PutLogEvents"
            ],
            "Resource": [
                "arn:aws:logs:${var.region}:${var.account}:log-group:/aws/codebuild/*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:GetObjectVersion",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${var.project}*"
            ],
            "Effect": "Allow"
        },
        {
            "Action": [
                "eks:*"
            ],
            "Resource": [
                "*"
            ],
            "Effect": "Allow"
        }
    ]
}
POLICY
}

