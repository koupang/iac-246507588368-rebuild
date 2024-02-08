locals {
  //filtering the resources which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  rt_mapping = {
    for rt in var.route_tables : rt.route_table.tags["PrevId"] => rt.route_table.id
    if contains(keys(rt.route_table.tags), "PrevId")
  }
  prefix_list_mapping = {
    for pl in data.aws_ec2_managed_prefix_list.this : pl.tags["PrevId"] => pl.id
    if contains(keys(pl.tags), "PrevId")
  }
  network_interface_mapping = {
    for eni in var.network_interfaces : eni.network_interface.tags["PrevId"] => eni.network_interface.id
    if contains(keys(eni.network_interface.tags), "PrevId")
  }
  igw_mapping = {
    for igw in var.internet_gateways : igw.internet_gateway.tags["PrevId"] => igw.internet_gateway.id
    if contains(keys(igw.internet_gateway.tags), "PrevId")
  }
  vpg_mapping = {
    for vpg in var.vpn_gateways : vpg.vpn_gateway.tags["PrevId"] => vpg.vpn_gateway.id
    if contains(keys(vpg.vpn_gateway.tags), "PrevId")
  }
  gateway_mapping = merge(local.igw_mapping, local.vpg_mapping)

  nat_mapping = {
    for nat in var.nat_gateways : nat.nat_gateway.tags["PrevId"] => nat.nat_gateway.id
    if contains(keys(nat.nat_gateway.tags), "PrevId")
  }
  vpce_mapping = {
    for vpce in var.vpc_endpoints : vpce.vpc_endpoint.tags["PrevId"] => vpce.vpc_endpoint.id
    if contains(keys(vpce.vpc_endpoint.tags), "PrevId")
  }

  //parse new resource IDS
  new_rt_ids = {
    for route, rt_id in var.route_tables_with_legacy_relations : route => lookup(local.rt_mapping, rt_id, rt_id)
  }

  new_prefix_list_ids = {
    for route, prefix_list_id in var.route_prefix_list_ids_with_legacy_relations : route => lookup(local.prefix_list_mapping, prefix_list_id, prefix_list_id) 
  }

  new_gateways = {
    for route, gateway_id in var.route_gateways_with_legacy_relations : route => lookup(local.gateway_mapping, gateway_id, gateway_id)
  }

  new_nat_gateways = {
    for route, nat_gateway_id in var.route_nat_gateways_with_legacy_relations : route => lookup(local.nat_mapping, nat_gateway_id, nat_gateway_id)
  }

  new_network_interfaces = {
    for route, network_interface_id in var.route_network_interfaces_with_legacy_relations : route => lookup(local.network_interface_mapping, network_interface_id, network_interface_id)
  }

  new_vpc_endpoints = {
    for route, vpc_endpoint_id in var.route_vpc_endpoints_with_legacy_relations : route => lookup(local.vpce_mapping, vpc_endpoint_id, vpc_endpoint_id)
  }

}

output "route_tables_with_legacy_relations" {
  value = var.route_tables_with_legacy_relations
}
output "route_prefix_list_ids_with_legacy_relations" {
  value = var.route_prefix_list_ids_with_legacy_relations
}
output "route_gateways_with_legacy_relations" {
  value = var.route_gateways_with_legacy_relations
}
output "route_nat_gateways_with_legacy_relations" {
  value = var.route_nat_gateways_with_legacy_relations
}
output "route_network_interfaces_with_legacy_relations" {
  value = var.route_network_interfaces_with_legacy_relations
}
output "route_vpc_endpoints_with_legacy_relations" {
  value = var.route_vpc_endpoints_with_legacy_relations
}

output "rt_mapping" {
  value = local.rt_mapping
}

output "prefix_list_mapping" {
  value = local.prefix_list_mapping
}

output "network_interface_mapping" {
  value = local.network_interface_mapping
}

output "gateway_mapping" {
  value = local.gateway_mapping
}

output "nat_mapping" {
  value = local.nat_mapping
}

output "vpce_mapping" {
  value = local.vpce_mapping
}

output "new_rt_ids" {
  value = local.new_rt_ids
}
output "new_prefix_list_ids" {
  value = local.new_prefix_list_ids
}
output "new_gateways" {
  value = local.new_gateways
}
output "new_nat_gateways" {
  value = local.new_nat_gateways
}
output "new_network_interfaces" {
  value = local.new_network_interfaces
}
output "new_vpc_endpoints" {
  value = local.new_vpc_endpoints
}