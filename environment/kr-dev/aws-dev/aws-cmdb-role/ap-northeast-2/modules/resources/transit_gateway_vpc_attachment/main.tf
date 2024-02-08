locals {
  tags = merge(var.tags, {
    Name = var.name
  })
}

data "aws_ec2_transit_gateway" "this" {
  filter {
    name   = "tag:PrevId"
    values = [var.prev_transit_gateway_id]
  }
  filter {
    name   = "state"
    values = ["available"]
  }

}

resource "aws_ec2_transit_gateway_vpc_attachment" "this" {
  subnet_ids         = var.subnet_ids
  transit_gateway_id = data.aws_ec2_transit_gateway.this.id
  vpc_id             = var.vpc_id
  tags               = local.tags
}