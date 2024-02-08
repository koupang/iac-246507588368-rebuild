provider "aws" {
  region = var.region
  dynamic "assume_role" {
    for_each = var.enable_assume_role ? [1] : []
    content {
      role_arn = var.role_arn
    }
  }
}

module "vpc_peering_route" {
  source = "../modules/resources/route"

  // for prev vpc-peering connection list
  for_each = var.vpc_peering_routes

  route_arguments = {
    route_table_id = module.legacy_route.new_rt_ids[each.key]

    destination_cidr_block      = try(length(each.value.cidr_block), 0) > 0 ? each.value.cidr_block : null
    destination_ipv6_cidr_block = try(length(each.value.ipv6_cidr_block), 0) > 0 ? each.value.ipv6_cidr_block : null
    destination_prefix_list_id  = try(length(module.legacy_route.new_prefix_list_ids[each.key]), 0) > 0 ? module.legacy_route.new_prefix_list_ids[each.key] : null

    vpc_peering_connection_id = try(length(module.legacy_route.new_peering_connection_ids[each.key]), 0) > 0 ? module.legacy_route.new_peering_connection_ids[each.key] : null
  }
}