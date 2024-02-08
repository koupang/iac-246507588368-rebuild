locals {
  tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_ec2_managed_prefix_list" "this" {
  address_family = var.address_family
  max_entries    = var.max_entries
  name           = var.name
  tags           = local.tags
}

resource "aws_ec2_managed_prefix_list_entry" "this" {
  for_each       = var.entry != null ? var.entry : {}
  cidr           = each.value.cidr
  description    = each.value.description
  prefix_list_id = aws_ec2_managed_prefix_list.this.id
}
