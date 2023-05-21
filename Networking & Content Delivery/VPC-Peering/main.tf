module "peer" {
  source                 = "../../../Modules/Networking & Content Delivery/VPC-Peering"
  main_id                = aws_vpc.main.id
  peer_id                = aws_vpc.peer.id
  peer_region            = var.peer_region
  auto_accept_connection = var.auto_accept_connection
  auto_accept            = var.auto_accept
  tags                   = var.tags
  providers              = { aws.peer = aws.peer }
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_main
  tags       = var.vpc_main_tags
}

resource "aws_vpc" "peer" {
  provider   = aws.peer
  cidr_block = var.vpc_cidr_peer
  tags       = var.vpc_peer_tags
}

resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, 1)
  tags       = var.subnet_public-1_tags
}

resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.peer.id
  cidr_block = cidrsubnet(aws_vpc.peer.cidr_block, 8, 1)
  provider   = aws.peer
  tags       = var.subnet_public-2_tags
}
data "aws_caller_identity" "peer" {
  provider = aws.peer
}

# Main Internal Gateway for VPC
resource "aws_internet_gateway" "igw-1" {
  vpc_id = aws_vpc.main.id
  tags   = var.IGW-1_tags
}

resource "aws_internet_gateway" "igw-2" {
  vpc_id   = aws_vpc.peer.id
  provider = aws.peer
  tags     = var.IGW-2_tags
}

resource "aws_route_table" "public-1" {
  vpc_id           = aws_vpc.main.id
  propagating_vgws = null
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-1.id
  }
  route {
    cidr_block                = var.vpc_cidr_peer
    vpc_peering_connection_id = module.peer.vpc_peering_connection_id
  }
  tags = var.route-1_tags
}

resource "aws_route_table" "public-2" {
  vpc_id           = aws_vpc.peer.id
  propagating_vgws = null
  provider         = aws.peer
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-2.id
  }
  route {
    cidr_block                = var.vpc_cidr_main
    vpc_peering_connection_id = module.peer.vpc_peering_connection_id
  }
  tags = var.route-2_tags
}
