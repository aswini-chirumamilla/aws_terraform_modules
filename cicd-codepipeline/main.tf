# CODEPIPELINE-SPRING

resource "aws_codepipeline" "tf_codepipelines" {
  for_each = toset(var.microservicelist)                              # FOR LOOP
  name     = "${var.project}-${each.key}-${var.sourcebranch}"
  role_arn = var.iamrole
  artifact_store {
    location = var.pipelines3
    type     = "S3"
  }
  #....................STAGE-01, SOURCE....................................#
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["SourceArtifact"]
      namespace      = "SourceVariables"
      configuration = {
        RepositoryName = "${var.project}-${each.key}"
        BranchName     = "${var.sourcebranch}"
      }
    }
  }
  #....................STAGE-02, BUILD....................................#
  stage {
    name = "SpringBuild"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["SourceArtifact"]
      version          = "1"
      configuration = {
        ProjectName =  "${var.project}-javabuild"
        EnvironmentVariables = jsonencode([
          # variable-01
          {
            name  = "AwsRegion"
            value = "${var.targetregion}"
            type  = "PLAINTEXT"
          },
          # variable-02
          {
            name  = "ServiceName"
            value = "${var.project}-${each.key}"
            type  = "PLAINTEXT"
          },
          # variable-03
          {
            name  = "ImageTagPrefix"
            value = "${var.imagetagprefix}"
            type  = "PLAINTEXT"
          },
          # variable-04
          {
            name  = "ImageTagSuffix"
            value = "${var.imagetagsufix}"
            type  = "PLAINTEXT"
          },
          # variable-05
          {
            name  = "SonarHost"
            value = "test_value1"
            type  = "PLAINTEXT"
          },
          # variable-06
          {
            name  = "SonarToken"
            value = "test_value1"
            type  = "PLAINTEXT"
          },
        ])

      }
    }
  }
  #....................STAGE-03, DEV DEPLOY....................................#
  stage {
    name = "SpringDeployDev"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceArtifact"]
      configuration = {
        ProjectName =  "${var.project}-javadeploy"
        EnvironmentVariables = jsonencode([
          # variable-01
          {
            name  = "AwsRegion"
            value = "${var.targetregion}"
            type  = "PLAINTEXT"
          },
          # variable-02
          {
            name  = "TargetAccountId"
            value = "${var.account}"
            type  = "PLAINTEXT"
          },
          # variable-03  
          {
            name  = "Environment"
            value = "${var.targetenvdev}"
            type  = "PLAINTEXT"
          },
          # variable-04 
          {
            name  = "EKSClusterName"
            value = "${var.targetk8sclusterdev}"
            type  = "PLAINTEXT"
          },
          # variable-05
          {
            name  = "ServiceName"
            value = "${var.project}-${each.key}"
            type  = "PLAINTEXT"
          },
          # variable-06 
          {
            name  = "ContainerPort"
            value = "${var.containerport}"
            type  = "PLAINTEXT"
          },
          # variable-07 
          {
            name  = "ImageTagPrefix"
            value = "${var.imagetagprefix}"
            type  = "PLAINTEXT"
          },
          # variable-08 
          {
            name  = "ImageTagSuffix"
            value = "${var.imagetagsufix}"
            type  = "PLAINTEXT"
          },
          # variable-09 
          {
            name  = "Namespace"
            value = "${var.k8snamespacedev}"
            type  = "PLAINTEXT"
          },
          # variable-10
          {
            name  = "Project"
            value = "${var.project}"
            type  = "PLAINTEXT"
          },
        ])
      }
    }
  }
  #....................STAGE-04, STAGE DEPLOY APPROVAL....................................#
  stage {                                                         # APPROVAL STAGE
    name = "Manual_Approval"

    action {
      name     = "Manual-Approval"
      category = "Approval"
      owner    = "AWS"
      provider = "Manual"
      version  = "1"
      configuration = {
        NotificationArn = "${var.snstopic}"
      }
    }
  }
  #....................STAGE-05, INT DEPLOY....................................#
  stage {
    name = "SpringDeployStage"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["SourceArtifact"]
      configuration = {
        ProjectName =  "${var.project}-javadeploy"
        EnvironmentVariables = jsonencode([
          # variable-01
          {
            name  = "AwsRegion"
            value = "${var.region}"
            type  = "PLAINTEXT"
          },
          # variable-02
          {
            name  = "TargetAccountId"
            value = "${var.account}"
            type  = "PLAINTEXT"
          },
          # variable-03  
          {
            name  = "Environment"
            value = "${var.targetenvstage}"
            type  = "PLAINTEXT"
          },
          # variable-04 
          {
            name  = "EKSClusterName"
            value = "${var.targetk8sclusterstage}"
            type  = "PLAINTEXT"
          },
          # variable-05
          {
            name  = "ServiceName"
            value = "${var.project}-${each.key}"
            type  = "PLAINTEXT"
          },
          # variable-06 
          {
            name  = "ContainerPort"
            value = "${var.containerport}"
            type  = "PLAINTEXT"
          },
          # variable-07 
          {
            name  = "ImageTagPrefix"
            value = "${var.imagetagprefix}"
            type  = "PLAINTEXT"
          },
          # variable-08 
          {
            name  = "ImageTagSuffix"
            value = "${var.imagetagsufix}"
            type  = "PLAINTEXT"
          },
          # variable-09 
          {
            name  = "Namespace"
            value = "${var.k8snamespacestage}"
            type  = "PLAINTEXT"
          },
          # variable-10
          {
            name  = "Project"
            value = "${var.project}"
            type  = "PLAINTEXT"
          },
        ])
      }
    }
  }
}