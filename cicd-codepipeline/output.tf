output "codepipelines" {
  value = aws_codepipeline.tf_codepipelines[*]
  description = "CODEPIPELINE MICRO SERVICES DEPLOYMENT TO EKS"
}

