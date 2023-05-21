output "codecommit-repos" {
  value = aws_codecommit_repository.tf_repo[*]
  description = "codecommit repos for micro services source"
}