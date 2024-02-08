resource "aws_security_group_rule" "ssg" {

  // resource to create security group rule which have multiple source-security-group-id
  count = (var.self == false &&
    length(var.cidr_blocks) == 0 &&
    length(var.ipv6_cidr_blocks) == 0 &&
  length(var.source_security_groups) != 0) ? length(var.source_security_groups) : 0

  source_security_group_id = var.source_security_groups[count.index]
  type                     = var.type
  security_group_id        = var.security_group_id
  description              = var.description
  from_port                = var.from_port
  to_port                  = var.to_port
  protocol                 = var.protocol
  prefix_list_ids          = var.prefix_list_ids
}

resource "aws_security_group_rule" "self" {

  // resource to create security group rule which have self as source-security-group-id
  count = (var.self == true &&
    length(var.cidr_blocks) == 0 &&
    length(var.ipv6_cidr_blocks) == 0 &&
  length(var.source_security_groups) == 0) ? 1 : 0

  type              = var.type
  security_group_id = var.security_group_id
  description       = var.description
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  prefix_list_ids   = var.prefix_list_ids
  self              = var.self
}

resource "aws_security_group_rule" "rest" {

  // resource to create security group rule which have cidr_blocks as source-security-group-id

  count = (var.self == false &&
  length(var.source_security_groups) == 0) ? 1 : 0

  type              = var.type
  security_group_id = var.security_group_id
  description       = var.description
  from_port         = var.from_port
  to_port           = var.to_port
  protocol          = var.protocol
  cidr_blocks       = var.cidr_blocks
  prefix_list_ids   = var.prefix_list_ids
}


# resource "aws_security_group_rule" "ipv6" {

#   // resource to create security group rule which have ipv6 as source-security-group-id

#   count = (var.self == false &&
#     length(var.cidr_blocks) == 0 &&
#     length(var.ipv6_cidr_blocks) != 0 &&
#   length(var.source_security_groups) == 0) ? 1 : 0

#   type              = var.type
#   security_group_id = var.security_group_id
#   description       = var.description
#   from_port         = var.from_port
#   to_port           = var.to_port
#   protocol          = var.protocol
#   ipv6_cidr_blocks  = var.ipv6_cidr_blocks
#   prefix_list_ids   = var.prefix_list_ids

# }

