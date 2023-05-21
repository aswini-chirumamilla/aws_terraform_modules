
#creating internet gateway
resource "aws_internet_gateway" "internet_gateway" {

  vpc_id              = var.vpc_id
  tags                = var.aws_internet_gateway_tags
}

