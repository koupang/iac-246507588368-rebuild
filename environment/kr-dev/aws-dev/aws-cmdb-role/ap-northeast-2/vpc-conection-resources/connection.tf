locals {
  //{"rtb-0e9e05d593d2f7325-route1" : "rtb-old1"}
  route_table_ids_with_legacy_relations = {
    for route_name, route in coalesce(var.vpc_peering_routes, {}) : route_name => route.route_table_id
  }
  //{"rtb-0e9e05d593d2f7325-route1" : "pl-old1"}
  prefix_list_id_with_legacy_relations = {
    for route_name, route in coalesce(var.vpc_peering_routes, {}) : route_name => route.destination_prefix_list_id
  }
  //{"rtb-0e9e05d593d2f7325-route1" : "pcx-old1"}
  vpc_peering_connections_with_legacy_relations = {
    for route_name, route in coalesce(var.vpc_peering_routes, {}) : route_name => route.vpc_peering_connection_id
  }
}

## modules to analyze the legacy relationships
## input1: { subnet_key : [oldID1, oldID2] }
## output1: { subnet_key : [newID1, newID2] }
## input2: { subnet_name1 : oldID1 }
## output2: { subnet_name1 : newID1 }

module "legacy_route" {
  source = "../modules/relations/legacy_vpc_peering_route"

  route_table_ids_with_legacy_relations             = local.route_table_ids_with_legacy_relations
  prefix_list_id_with_legacy_relations           = local.prefix_list_id_with_legacy_relations
  vpc_peering_connections_with_legacy_relations    = local.vpc_peering_connections_with_legacy_relations
}