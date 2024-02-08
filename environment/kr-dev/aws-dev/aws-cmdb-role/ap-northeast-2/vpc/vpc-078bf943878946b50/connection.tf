locals {

  tgw_attachment_subnets_with_legacy_relations = {
    for tgw_attachment_name, attachment in coalesce(var.transit_gateway_vpc_attachments, {}) : tgw_attachment_name => attachment.prev_subnet_ids
  }

  nat_set = {
    for nat_gateway_name, attributes in coalesce(var.nat_gateways, {}) : nat_gateway_name => attributes.prev_subnet_id
  }

  eip_set = {
    for nat_gateway_name, attributes in coalesce(var.nat_gateways, {}) : nat_gateway_name => attributes.prev_allocation_id
  }

  nacl_subnets_with_legacy_relations = {
    for nacl_name, nacl in coalesce(var.network_acls, {}) : nacl_name => nacl.prev_subnet_ids
  }

  //{"ingress-from-53-tcp" : "sg-old1"}
  security_groups_with_legacy_relations = {
    for security_group_rule_name, attributes in coalesce(var.security_group_rules, {}) : security_group_rule_name => attributes.security_group_id
  }

  //{"ingress-from-53-tcp" : ["sg-old1", "sg-old2"]}
  source_security_group_ids_with_legacy_relations = {
    for security_group_rule_name, security_group_rule in coalesce(var.security_group_rules, {}) : security_group_rule_name => security_group_rule.security_groups
  }
  //{"ingress-from-53-tcp" : ["pl-1231234", "pl-1231235"]}
  prefix_list_ids_with_legacy_relations = {
    for security_group_rule_name, security_group_rule in coalesce(var.security_group_rules, {}) : security_group_rule_name => security_group_rule.prefix_list_ids
  }

  main_route_table_id_with_legacy_relations = {
    for route_table_name, attributes in coalesce(var.main_route_table_associations, {}) : route_table_name => attributes.prev_route_table_id
  }

  rt_subnets_with_legacy_relations = {
    for route_table_name, attributes in coalesce(var.route_table_associations, {}) : route_table_name => attributes.prev_subnet_id
  }

  associations_rt_with_legacy_relations = {
    for route_table_name, attributes in coalesce(var.route_table_associations, {}) : route_table_name => attributes.prev_route_table_id
  }

  //relations for routes
  route_tables_with_legacy_relations = {
    for route_name, attributes in coalesce(var.routes, {}) : route_name => attributes.route_table_id
  }
  route_prefix_list_ids_with_legacy_relations = {
    for route_name, attributes in coalesce(var.routes, {}) : route_name => attributes.destination_prefix_list_id
  }
  route_gateways_with_legacy_relations = {
    for route_name, attributes in coalesce(var.routes, {}) : route_name => attributes.gateway_id
  }
  route_nat_gateways_with_legacy_relations = {
    for route_name, attributes in coalesce(var.routes, {}) : route_name => attributes.nat_gateway_id
  }
  route_network_interfaces_with_legacy_relations = {
    for route_name, attributes in coalesce(var.routes, {}) : route_name => attributes.network_interface_id
  }
  route_vpc_endpoints_with_legacy_relations = {
    for route_name, attributes in coalesce(var.routes, {}) : route_name => attributes.vpc_endpoint_id
  }

  vpce_rt_with_legacy_relations = {
    for vpce_name, attributes in coalesce(var.vpc_endpoints, {}) : vpce_name => attributes.prev_route_table_ids
  }

  vpce_subnets_with_legacy_relations = {
    for vpce_name, attributes in coalesce(var.vpc_endpoints, {}) : vpce_name => attributes.prev_subnet_ids
  }

  vpce_sg_with_legacy_relations = {
    for vpce_name, attributes in coalesce(var.vpc_endpoints, {}) : vpce_name => attributes.prev_security_group_ids
  }

  eni_subnets_with_legacy_relations = {
    for eni_name, attributes in coalesce(var.network_interfaces, {}) : eni_name => attributes.prev_subnet_id
  }

  eni_sg_with_legacy_relations = {
    for eni_name, attributes in coalesce(var.network_interfaces, {}) : eni_name => attributes.prev_security_groups
  }
}

## modules to analyze the legacy relationships
## input1: { subnet_key : [oldID1, oldID2] }
## output1: { subnet_key : [newID1, newID2] }
## input2: { subnet_name1 : oldID1 }
## output2: { subnet_name1 : newID1 }

module "connection_nat_gateway" {
  source = "../../modules/relations/connection_nat_gateway"

  subnets = merge(module.subnet)
  nat_set = local.nat_set
}

module "connection_eip" {
  source = "../../modules/relations/connection_eip"

  eips    = merge(module.eip)
  eip_set = local.eip_set
}

module "legacy_nacl" {
  source = "../../modules/relations/legacy_nacl"

  subnets                            = merge(module.subnet)
  nacl_subnets_with_legacy_relations = local.nacl_subnets_with_legacy_relations
}

module "legacy_tgw" {
  source = "../../modules/relations/legacy_tgw"

  subnets                                      = merge(module.subnet)
  tgw_attachment_subnets_with_legacy_relations = local.tgw_attachment_subnets_with_legacy_relations
}

module "legacy_security_group" {
  source = "../../modules/relations/legacy_security_group"

  security_groups = merge(module.security_group) //security group output

  security_groups_with_legacy_relations           = local.security_groups_with_legacy_relations
  source_security_group_ids_with_legacy_relations = local.source_security_group_ids_with_legacy_relations
}

module "legacy_prefix_list" {
  source = "../../modules/relations/legacy_prefix_list"

  prefix_list_ids_with_legacy_relations = local.prefix_list_ids_with_legacy_relations
}

module "legacy_route_table" {
  source = "../../modules/relations/legacy_route_table"

  route_tables                         = merge(module.route_table)
  route_table_id_with_legacy_relations = local.main_route_table_id_with_legacy_relations
}

module "legacy_route_table_association" {
  source = "../../modules/relations/legacy_route_table_association"

  route_tables                          = merge(module.route_table)
  associations_rt_with_legacy_relations = local.associations_rt_with_legacy_relations
}

module "legacy_route_table_subnet" {
  source = "../../modules/relations/legacy_route_table_subnet"

  subnets                          = merge(module.subnet)
  rt_subnets_with_legacy_relations = local.rt_subnets_with_legacy_relations
}

module "legacy_route" {
  source = "../../modules/relations/legacy_route"

  route_tables       = merge(module.route_table)
  network_interfaces = merge(module.network_interface)
  internet_gateways  = merge(module.internet_gateway)
  vpn_gateways       = merge(module.vpn_gateway)
  nat_gateways       = merge(module.nat_gateway)
  vpc_endpoints      = merge(module.vpc_endpoint)

  route_tables_with_legacy_relations             = local.route_tables_with_legacy_relations
  route_prefix_list_ids_with_legacy_relations    = local.route_prefix_list_ids_with_legacy_relations
  route_gateways_with_legacy_relations           = local.route_gateways_with_legacy_relations
  route_nat_gateways_with_legacy_relations       = local.route_nat_gateways_with_legacy_relations
  route_network_interfaces_with_legacy_relations = local.route_network_interfaces_with_legacy_relations
  route_vpc_endpoints_with_legacy_relations      = local.route_vpc_endpoints_with_legacy_relations
}

module "legacy_vpce_route_table" {
  source = "../../modules/relations/legacy_vpce_route_table"

  route_tables                  = merge(module.route_table)
  vpce_rt_with_legacy_relations = local.vpce_rt_with_legacy_relations
}

module "legacy_vpce_subnet" {
  source = "../../modules/relations/legacy_vpce_subnet"

  subnets                            = merge(module.subnet)
  vpce_subnets_with_legacy_relations = local.vpce_subnets_with_legacy_relations
}

module "legacy_vpce_security_group" {
  source = "../../modules/relations/legacy_vpce_security_group"

  security_groups               = merge(module.security_group)
  vpce_sg_with_legacy_relations = local.vpce_sg_with_legacy_relations
}

module "legacy_subnet_id" {

  source  = "../../modules/relations/legacy_subnet_id"
  subnets = merge(module.subnet)
}

module "legacy_tgw_vpc_attachment_id" {
  source                          = "../../modules/relations/legacy_tgw_vpc_attachment_id"
  transit_gateway_vpc_attachments = merge(module.transit_gateway_vpc_attachment)
}

module "legacy_eni_subnet" {
  source = "../../modules/relations/legacy_eni_subnet"

  subnets                           = merge(module.subnet)
  eni_subnets_with_legacy_relations = local.eni_subnets_with_legacy_relations
}

module "legacy_eni_security_group" {
  source = "../../modules/relations/legacy_eni_security_group"

  security_groups              = merge(module.security_group)
  eni_sg_with_legacy_relations = local.eni_sg_with_legacy_relations
}
