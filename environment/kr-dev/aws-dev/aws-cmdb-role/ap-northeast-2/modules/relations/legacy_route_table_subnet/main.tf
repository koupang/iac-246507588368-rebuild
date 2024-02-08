locals {
  //filtering the route tables which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  //rt_mapping = {rt-old1 = "rt-new1"}
  subnet_mapping = {
    for s in var.subnets : s.subnet.tags["PrevId"] => s.subnet.id
    if contains(keys(s.subnet.tags), "PrevId")
  }

  new_subnets = {
    for subnet, subnet_id in var.rt_subnets_with_legacy_relations : subnet => lookup(local.subnet_mapping, subnet_id, subnet_id)
  }
}

output "rt_subnets_with_legacy_relations" {
  value = var.rt_subnets_with_legacy_relations
}

output "subnet_mapping" {
  value = local.subnet_mapping
}

output "new_subnets" {
  value = local.new_subnets
}