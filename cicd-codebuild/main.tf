resource "aws_codebuild_project" "tf_codebuild" {
  name          = var.codebuild-name
  description   = var.codebuild-description
  build_timeout = "30"
  service_role  = var.service-role-iam

  source {                                                          # pipeline-source and buildspec
    type      = "CODEPIPELINE"
    buildspec = file("${path.module}/../../Resource usage/cicd-microservices/buildspecs/${var.buildspec}")
  }

  environment {                                                      # codebuild environment details
    compute_type                = "BUILD_GENERAL1_MEDIUM"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

  }

  artifacts {                                                         # pipeline artifacts
    type = "CODEPIPELINE"
  }

  cache {
    type     = "S3"
    location = var.s3cache                                            # codebuild cache bucket
  }

  tags = {                                                            # tags
    Terraform = "true"
  }
}