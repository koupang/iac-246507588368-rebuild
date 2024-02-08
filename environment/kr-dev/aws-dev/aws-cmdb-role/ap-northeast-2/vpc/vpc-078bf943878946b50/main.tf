provider "aws" {
  region = var.vpc.region
  dynamic "assume_role" {
    for_each = var.enable_assume_role ? [1] : []
    content {
      role_arn = var.role_arn
    }
  }
}

## modules to create new resources

module "vpc" {
  source = "../../modules/resources/vpc"

  name                             = var.vpc.name
  cidr_block                       = var.vpc.cidr_block
  tags                             = var.vpc.tags
  enable_dns_hostnames             = var.vpc.enable_dns_hostnames != null ? var.vpc.enable_dns_hostnames : false
  assign_generated_ipv6_cidr_block = var.vpc.assign_generated_ipv6_cidr_block
}

module "ipv4_cidr_block_association" {
  source   = "../../modules/resources/ipv4_cidr_block_association"
  for_each = var.ipv4_cidr_block_associations != null ? var.ipv4_cidr_block_associations : {}

  vpc_id     = module.vpc.vpc_id
  cidr_block = each.value.cidr_block
}

module "subnet" {
  source = "../../modules/resources/subnet"

  for_each          = var.subnets != null ? var.subnets : {}
  vpc_id            = module.vpc.vpc_id
  name              = each.value.name
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags              = each.value.tags
}

module "network_acl" {
  source = "../../modules/resources/network_acl"

  for_each   = var.network_acls != null ? var.network_acls : {}
  name       = each.value.name
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.legacy_nacl.new_nacl_subnets[each.key]
  ingress    = each.value.ingress
  egress     = each.value.egress
  tags       = each.value.tags
}

module "transit_gateway_vpc_attachment" {
  source = "../../modules/resources/transit_gateway_vpc_attachment"

  for_each = var.transit_gateway_vpc_attachments != null ? var.transit_gateway_vpc_attachments : {}

  name                    = each.value.name
  prev_transit_gateway_id = each.value.prev_transit_gateway_id
  subnet_ids              = module.legacy_tgw.new_tgw_attachment_subnets[each.key]
  vpc_id                  = module.vpc.vpc_id
  tags                    = each.value.tags
}

module "vpn_gateway" {
  source = "../../modules/resources/vpn_gateway"

  for_each          = var.vpn_gateways != null ? var.vpn_gateways : {}
  name              = each.key
  vpc_id            = module.vpc.vpc_id
  amazon_side_asn   = each.value.amazon_side_asn
  availability_zone = each.value.availability_zone
  tags              = each.value.tags
}

module "internet_gateway" {
  source = "../../modules/resources/internet_gateway"

  for_each = var.internet_gateways != null ? var.internet_gateways : {}
  vpc_id   = module.vpc.vpc_id
  tags     = each.value.tags
}

module "eip" {
  source = "../../modules/resources/eip"

  for_each             = var.eips != null ? var.eips : {}
  domain               = each.value.domain
  network_border_group = each.value.network_border_group
  public_ipv4_pool     = each.value.public_ipv4_pool
  tags                 = each.value.tags
}

module "nat_gateway" {
  source = "../../modules/resources/nat_gateway"

  for_each          = var.nat_gateways != null ? var.nat_gateways : {}
  connectivity_type = each.value.connectivity_type
  allocation_id     = each.value.connectivity_type == "public" ? module.legacy_eip.eip_new_set[each.key] : null
  subnet_id         = module.legacy_nat_gateway.nat_new_set[each.key]
  tags              = each.value.tags
}

module "security_group" {
  source = "../../modules/resources/security_group"

  for_each    = var.security_groups != null ? var.security_groups : {}
  name        = each.value.name
  description = each.value.description
  vpc_id      = module.vpc.vpc_id

  tags = each.value.tags
}

module "security_group_rule" {

  source = "../../modules/resources/security_group_rule"

  for_each = var.security_group_rules != null ? var.security_group_rules : {}

  type              = each.value.type
  security_group_id = module.legacy_security_group.new_security_groups[each.key]
  description       = each.value.description
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  ipv6_cidr_blocks  = each.value.ipv6_cidr_blocks
  prefix_list_ids   = module.legacy_prefix_list.new_prefix_list_ids[each.key]

  self                   = each.value.self
  source_security_groups = module.legacy_security_group.new_source_security_group_ids[each.key]
}

module "route_table" {
  source = "../../modules/resources/route_table"

  for_each = var.route_tables != null ? var.route_tables : {}

  vpc_id = module.vpc.vpc_id
  tags   = each.value.tags
}

module "route_table_route" {
  source = "../../modules/resources/route"

  for_each = var.routes != null ? var.routes : {}

  # If the variable is empty string(""), then convert from the empty string to null to apply optional variable in route module.
  route_arguments = {
    route_table_id = module.legacy_route.new_rt_ids[each.key]

    destination_cidr_block      = try(length(each.value.cidr_block), 0) > 0 ? each.value.cidr_block : null
    destination_ipv6_cidr_block = try(length(each.value.ipv6_cidr_block), 0) > 0 ? each.value.ipv6_cidr_block : null
    destination_prefix_list_id  = try(length(module.legacy_route.new_prefix_list_ids[each.key]), 0) > 0 ? module.legacy_route.new_prefix_list_ids[each.key] : null

    gateway_id           = try(length(module.legacy_route.new_gateways[each.key]), 0) > 0 ? module.legacy_route.new_gateways[each.key] : null
    nat_gateway_id       = try(length(module.legacy_route.new_nat_gateways[each.key]), 0) > 0 ? module.legacy_route.new_nat_gateways[each.key] : null
    network_interface_id = try(length(module.legacy_route.new_network_interfaces[each.key]), 0) > 0 ? module.legacy_route.new_network_interfaces[each.key] : null
    transit_gateway_id   = try(length(each.value.transit_gateway_id), 0) > 0 ? each.value.transit_gateway_id : null
    vpc_endpoint_id      = try(length(module.legacy_route.new_vpc_endpoints[each.key]), 0) > 0 ? module.legacy_route.new_vpc_endpoints[each.key] : null
  }
}

module "main_route_table_association" {
  source = "../../modules/resources/main_route_table_association"

  for_each = var.main_route_table_associations != null ? var.main_route_table_associations : {}

  vpc_id         = module.vpc.vpc_id
  route_table_id = module.legacy_route_table.new_route_tables[each.value.id]
}

module "route_table_association" {
  source = "../../modules/resources/route_table_association"

  for_each = var.route_table_associations != null ? var.route_table_associations : {}

  route_table_id = module.legacy_route_table_association.new_route_tables[each.value.id]
  subnet_id      = module.legacy_route_table_subnet.new_subnets[each.value.id]
  gateway_id     = null
}

module "vpc_endpoint" {
  source = "../../modules/resources/vpc_endpoint"

  for_each = var.vpc_endpoints != null ? var.vpc_endpoints : {}

  vpc_id              = module.vpc.vpc_id
  service_name        = each.value.service_name
  route_table_ids     = module.legacy_vpce_route_table.new_route_tables[each.key]
  subnet_ids          = module.legacy_vpce_subnet.new_subnets[each.key]
  security_group_ids  = module.legacy_vpce_security_group.new_security_groups[each.key]
  vpc_endpoint_type   = each.value.vpc_endpoint_type
  private_dns_enabled = each.value.private_dns_enabled
  policy              = each.value.policy

  dns_options = each.value.dns_options

  tags = each.value.tags
}


module "vpc_flow_logs" {

  source = "../../modules/resources/vpc_flow_log"

  for_each = var.vpc_flow_logs != null ? var.vpc_flow_logs : {}

  vpc_id = module.vpc.vpc_id

  traffic_type             = each.value.traffic_type
  log_destination_type     = each.value.log_destination_type
  log_destination          = each.value.log_destination
  log_format               = each.value.log_format
  max_aggregation_interval = each.value.max_aggregation_interval
  destination_options      = each.value.destination_options
  tags                     = each.value.tags
  // using previous subnet id ( new_subnet_map )to query the new subnet id from legacy_subnet_id module
  subnet_id                     = each.value.subnet_id != null ? module.legacy_subnet_id.new_subnet_map[each.value.subnet_id] : null
  transit_gateway_attachment_id = each.value.transit_gateway_attachment_id != null ? module.legacy_tgw_vpc_attachment_id.new_tgw_vpc_attachment_map[each.value.transit_gateway_attachment_id] : null
  transit_gateway_id            = each.value.transit_gateway_id
  // we do not care about eni_id cause it's not imported by import utility
}

module "network_interface" {
  source = "../../modules/resources/network_interface"

  for_each = var.network_interfaces != null ? var.network_interfaces : {}

  description = each.value.description
  subnet_id   = module.legacy_eni_subnet.new_subnets[each.key]
  # interface_type  = each.value.interface_type
  security_groups = module.legacy_eni_security_group.new_security_groups[each.key]

  tags = each.value.tags
}
