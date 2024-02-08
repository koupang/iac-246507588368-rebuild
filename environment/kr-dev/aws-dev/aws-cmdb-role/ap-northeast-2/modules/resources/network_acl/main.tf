locals {
  tags = merge(var.tags, {
    Name = var.name
  })
}

###################################################
# Network ACL
###################################################

# INFO: Not supported attributes
# - `ingress`
# - `egress`
resource "aws_network_acl" "this" {
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  tags = merge(
    {
      "Name" = local.tags.Name
    },
    var.tags,
  )


}

###################################################
# Network ACL Rules
###################################################

resource "aws_network_acl_rule" "ingress" {
  for_each = var.ingress

  network_acl_id = aws_network_acl.this.id

  egress = false

  rule_number     = each.key
  rule_action     = lower(each.value.action)
  protocol        = each.value.protocol
  from_port       = each.value.from_port
  to_port         = each.value.to_port
  icmp_type       = each.value.icmp_type
  icmp_code       = each.value.icmp_code
  cidr_block      = each.value.cidr_block
  ipv6_cidr_block = each.value.ipv6_cidr_block == "" ? null : each.value.ipv6_cidr_block
}

resource "aws_network_acl_rule" "egress" {
  for_each = var.egress

  network_acl_id = aws_network_acl.this.id

  egress          = true
  rule_number     = each.key
  rule_action     = lower(each.value.action)
  protocol        = each.value.protocol
  from_port       = each.value.from_port
  to_port         = each.value.to_port
  icmp_type       = each.value.icmp_type
  icmp_code       = each.value.icmp_code
  cidr_block      = each.value.cidr_block
  ipv6_cidr_block = each.value.ipv6_cidr_block == "" ? null : each.value.ipv6_cidr_block
}
