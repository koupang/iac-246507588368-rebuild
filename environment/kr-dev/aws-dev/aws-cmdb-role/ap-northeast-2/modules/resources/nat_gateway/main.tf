resource "aws_nat_gateway" "this" {
  subnet_id         = var.subnet_id
  connectivity_type = var.connectivity_type
  allocation_id = var.allocation_id

  tags              = var.tags
}