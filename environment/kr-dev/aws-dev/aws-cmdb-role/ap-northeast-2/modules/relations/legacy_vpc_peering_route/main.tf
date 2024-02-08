locals {
  //filtering the resources which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  rt_mapping = {
    for rt in data.aws_route_table.rt_list : rt.tags["PrevId"] => rt.id
    if contains(keys(rt.tags), "PrevId")
  }
  prefix_list_mapping = {
    for pl in data.aws_ec2_managed_prefix_list.pl_list : pl.tags["PrevId"] => pl.id
    if contains(keys(pl.tags), "PrevId")
  }
  vpc_peering_connection_mapping = {
    for pc in data.aws_vpc_peering_connection.pc_list : pc.tags["PrevId"] => pc.id
    if contains(keys(pc.tags), "PrevId")
  }

  //parse new resource IDS
  new_rt_ids = {
    for route, rt_id in var.route_table_ids_with_legacy_relations : route => lookup(local.rt_mapping, rt_id, rt_id)
  }

  new_prefix_list_ids = {
    for route, prefix_list_id in var.prefix_list_id_with_legacy_relations : route => lookup(local.prefix_list_mapping, prefix_list_id, prefix_list_id) 
  }

  new_peering_connection_ids = {
    for route, peering_connection_id in var.vpc_peering_connections_with_legacy_relations : route => lookup(local.vpc_peering_connection_mapping, peering_connection_id, peering_connection_id)
  }
}

output "route_table_ids_with_legacy_relations" {
  value = var.route_table_ids_with_legacy_relations
}
output "prefix_list_id_with_legacy_relations" {
  value = var.prefix_list_id_with_legacy_relations
}
output "vpc_peering_connections_with_legacy_relations" {
  value = var.vpc_peering_connections_with_legacy_relations
}

output "rt_mapping" {
  value = local.rt_mapping
}
output "prefix_list_mapping" {
  value = local.prefix_list_mapping
}
output "vpc_peering_connection_mapping" {
  value = local.vpc_peering_connection_mapping
}

output "new_rt_ids" {
  value = local.new_rt_ids
}
output "new_prefix_list_ids" {
  value = local.new_prefix_list_ids
}
output "new_peering_connection_ids" {
  value = local.new_peering_connection_ids
}