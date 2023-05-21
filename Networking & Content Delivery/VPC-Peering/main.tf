# Requester's side of the connection.
resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.main_id
  peer_vpc_id   = var.peer_id
  peer_owner_id = data.aws_caller_identity.peer.account_id
  peer_region   = var.peer_region
  auto_accept   = var.auto_accept_connection
  tags = var.tags
}

# Accepter's side of the connection.
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = aws.peer
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = var.auto_accept
  tags                      = var.tags
}

data "aws_caller_identity" "peer" {
  provider = aws.peer
}