data "aws_secretsmanager_secret" "cred" {
  name = var.secretname
}
data "aws_secretsmanager_secret_version" "password" {
  secret_id = data.aws_secretsmanager_secret.cred.id
}