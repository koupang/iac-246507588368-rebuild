locals {
  //filtering the route tables which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  //rt_mapping = {rt-old1 = "rt-new1"}
  rt_mapping = {
    for rt in var.route_tables : rt.route_table.tags["PrevId"] => rt.route_table.id
    if contains(keys(rt.route_table.tags), "PrevId")
  }

  new_route_tables = {
    for route_table, route_table_id in var.associations_rt_with_legacy_relations : route_table => lookup(local.rt_mapping, route_table_id, route_table_id)
  }
}

output "associations_rt_with_legacy_relations" {
  value = var.associations_rt_with_legacy_relations
}

output "rt_mapping" {
  value = local.rt_mapping
}

output "new_route_tables" {
  value = local.new_route_tables
}