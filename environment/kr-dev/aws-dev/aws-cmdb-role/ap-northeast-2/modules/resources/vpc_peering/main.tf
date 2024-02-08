data "aws_vpc" "requester" {
  # provider = aws.requester
  id = var.requester.vpc_id
}

data "aws_vpc" "accepter" {
  # provider = aws.accepter
  id = var.accepter.vpc_id
}

data "aws_caller_identity" "peer" {
  # provider = aws.accepter
}

resource "aws_vpc_peering_connection" "peer" {
  # provider = aws.requester

  vpc_id        = data.aws_vpc.requester.id
  peer_vpc_id   = data.aws_vpc.accepter.id
  peer_owner_id = data.aws_caller_identity.peer.account_id
  auto_accept   = false

  tags = merge(var.requester.tags, {
    Name = var.name,
    Side = "Requester"
  })
}

resource "aws_vpc_peering_connection_accepter" "peer" {
  # provider = aws.accepter

  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true

  tags = merge(var.accepter.tags, {
    Name = var.name,
    Side = "Accepter"
  })
}

resource "aws_vpc_peering_connection_options" "requester" {
  # provider = aws.requester

  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_vpc_peering_connection_options" "accepter" {
  # provider = aws.accepter

  vpc_peering_connection_id = aws_vpc_peering_connection_accepter.peer.id

  accepter {
    allow_remote_vpc_dns_resolution = true
  }
}