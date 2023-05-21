module "tf_codecommit" {                          # CODECOMMIT
  source           = "../../Modules/cicd-codecommit"
  project          = var.project
  microservicelist = var.microservicelist
}

module "tf_ecr" {                                 # ECR
  source           = "../../Modules/cicd-ecr"
  project          = var.project
  microservicelist = var.microservicelist
}

module "tf_s3" {                                 # S3
  source           = "../../Modules/cicd-s3"
  project          = var.project
  region           = var.region
  bucketnames      = var.buckets
}

module "tf_iam" {                                # IAM
  source           = "../../Modules/cicd-iam"
  project          = var.project
  account          = var.account
  region           = var.region
}

module "tf_sns" {                                # SNSTOPIC
  source           = "../../Modules/cicd-sns"
  project          = var.project
}

module "tf_javabuild" {                         # CODEBUILDS
  source = "../../Modules/cicd-codebuild"

  codebuild-name        = "${var.project}-javabuild"
  codebuild-description = "${var.project}-javabuild"
  service-role-iam      = module.tf_iam.iam-codebuild-springbuild-role.arn
  buildspec             = "javabuild.yaml"
  s3cache               = "${var.project}-devops-${var.region}-codebuild-cache"
}

module "tf_javadeploy" {                        # CODEBUILDS
  source = "../../Modules/cicd-codebuild"

  codebuild-name        = "${var.project}-javadeploy"
  codebuild-description = "${var.project}-javadeploy"
  service-role-iam      = module.tf_iam.iam-codebuild-k8s-deploy-role.arn
  buildspec             = "javadeploy.yaml"
  s3cache               = "${var.project}-devops-${var.region}-codebuild-cache"
}

module "tf_codepipeline" {                     # CODEPIPELINES
  source = "../../Modules/cicd-codepipeline"

  sourcebranch                = var.source_branch
  project                     = var.project
  account                     = var.account
  region                      = var.region 
  iamrole                     = module.tf_iam.iam-pipeline-role.arn
  microservicelist            = var.microservicelist
  pipelines3                  = "${var.project}-devops-${var.region}-pipeline-atrifact-store"
  snstopic                    = module.tf_sns.sns-pipeline-approval.arn
  targetaccount               = var.account
  targetenvdev                = var.dev_environment
  targetenvstage              = var.stage_environment
  targetk8sclusterdev         = var.dev_k8scluster
  targetk8sclusterstage       = var.stage_k8scluster
  targetregion                = var.region
  containerport               = var.container_port
  imagetagprefix              = var.image_tagprefix
  imagetagsufix               = "#{SourceVariables.CommitId}"
  k8snamespacedev             = var.k8s_namespace_dev
  k8snamespacestage           = var.k8s_namespace_stage
  SonarHost                   = var.sonar_host                   
  SonarToken                  = var.sonar_token
}








