
# CODECOMMIT
output "codecommit-repos" {
  value = module.tf_codecommit.codecommit-repos[*]
  description = "Git repos for micro services"
}

# ECR
output "ecr-repos" {
  value = module.tf_ecr.ecr-repos[*]
  description = "ECR repository for micro services images"
}

# S3
output "s3-bucket-pipeline" {
  value = module.tf_s3.pipeline-bucket-s3[*]
  description = "s3 bucket for pipelines"
}

# IAM 
output "iam-codebuild-springbuild-role" {
  value = module.tf_iam.iam-codebuild-springbuild-role
  description = "IAM role for codebuild springbuild"
}
output "iam-pipeline-role" {
  value = module.tf_iam.iam-pipeline-role
  description = "IAM role for codepipelne service"
}
output "iam-codebuild-k8sdeploy-role" {
  value = module.tf_iam.iam-codebuild-k8s-deploy-role
  description = "IAM role for codebuild for K8s deployments"
}
output "iam-codebuild-springbuild-policy" {
  value = module.tf_iam.iam-codebuild-springbuild-policy
  description = "IAM policy attachent for codebuild springbuild"
}
output "iam-pipeline-policy" {
  value = module.tf_iam.iam-pipeline-policy
  description = "IAM policy attachent for pipeline role"
}
output "iam-codebuild-springdeploy-policy" {
  value = module.tf_iam.iam-codebuild-k8s-deploy-policy
  description = "IAM policy attachent for codebuild for k8s deployments"
}

# SNS 
output "sns-pipeline-approval" {
  value = module.tf_sns.sns-pipeline-approval
  description = "SNS notifications for pipeline manual approvals"
}

# CODEBUILDS
output "codebuild-javabuild" {
  value = module.tf_javabuild.codebuild
  description = "codebuild for java build"
}
output "codebuild-javadeploy" {
  value = module.tf_javadeploy.codebuild
  description = "codebuild for k8s deployments"
}

# CODEPIPELINES
output "codepipelines" {
  value = module.tf_codepipeline.codepipelines[*]
  description = "codepipeline for micro services CICD"
}


