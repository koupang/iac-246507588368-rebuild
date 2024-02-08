locals {
  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_ec2_transit_gateway" "this" {
  description = var.description
  tags        = local.tags
}