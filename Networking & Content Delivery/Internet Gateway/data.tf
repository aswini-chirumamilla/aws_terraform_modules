data "aws_vpc" "vpc" {
  id = var.vpc_id
}
data "aws_availability_zones" "az" {
  state = "available"
}
data "aws_caller_identity" "current" {}