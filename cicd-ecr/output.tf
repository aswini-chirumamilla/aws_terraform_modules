output "ecr-repos" {
  value = aws_ecr_repository.tf_ecr[*]
  description = "ecr repos"
}