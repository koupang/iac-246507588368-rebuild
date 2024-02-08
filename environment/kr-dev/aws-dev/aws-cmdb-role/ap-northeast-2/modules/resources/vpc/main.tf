# Adding a new key-value pair to the map
locals {
  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_vpc" "this" {
  cidr_block                       = var.cidr_block
  enable_dns_support               = "true"
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  enable_dns_hostnames             = var.enable_dns_hostnames

  tags = local.tags
}


resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
}
