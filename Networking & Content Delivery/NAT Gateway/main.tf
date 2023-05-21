module "nat" {
  source               = "../../../Modules/Networking & Content Delivery/NAT Gateway"
  allocation_id        = aws_eip.nat_eip.id
  subnet_id            = var.subnet_id
  connectivity_type    = var.connectivity_type
  private_ip           = var.private_ip
  tags                = var.tags
  
}

locals {
  name_tag_val = join("-", [data.aws_caller_identity.current.account_id, data.aws_availability_zones.az.id])
  tags         = { Name = local.name_tag_val }
}

# Private Subnet with Default Route to NAT Gateway
resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Private Subnet"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "NAT Gateway EIP"
  }
}

# Route Table for Private Subnet
resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = module.nat.nat_gateway_id
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Association between Private Subnet and Private Route Table
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}