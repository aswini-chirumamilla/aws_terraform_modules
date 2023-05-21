#Basic role created using "aws_iam_policy_document" data resource
resource "aws_iam_role" "beanstalk_service" {
  name               = "${random_integer.id.id}-elastic_beanstalk_instance_role"
  assume_role_policy = jsonencode(var.role_policy)
  tags               = merge(var.tags, var.iam_role_tags)
}


# random id generator
resource "random_integer" "id" {
  min = 10000
  max = 5000000
}

