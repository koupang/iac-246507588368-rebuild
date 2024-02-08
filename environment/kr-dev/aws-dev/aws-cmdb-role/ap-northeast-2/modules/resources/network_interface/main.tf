resource "aws_network_interface" "this" {
  description     = var.description
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  # interface_type  = var.interface_type

  tags = var.tags
}
