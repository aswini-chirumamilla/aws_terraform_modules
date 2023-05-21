output "iam-codebuild-springbuild-role" {
  value = aws_iam_role.tf_spring_build_role
  description = "IAM role for codebuild springbuild"
}

output "iam-pipeline-role" {
  value = aws_iam_role.tf_pipeline_role
  description = "IAM role for codebuild service"
}

output "iam-codebuild-k8s-deploy-role" {
  value = aws_iam_role.tf_k8s_deploy_role
  description = "IAM role for codebuild springdeploy"
}

output "iam-codebuild-springbuild-policy" {
  value = aws_iam_role_policy.tf_spring_build_policy
  description = "IAM policy attachent for codebuild springbuild"
}

output "iam-pipeline-policy" {
  value = aws_iam_role_policy.tf_pipeline_policy
  description = "IAM policy attachent for pipeline role"
}

output "iam-codebuild-k8s-deploy-policy" {
  value = aws_iam_role_policy.tf_k8s_deploy_policy
  description = "IAM policy attachent for codebuild springdeploy"
}
