locals {
  //filtering the subnets which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  //subnet_mapping = {subnet-old1 = "subnet-new1"}
  subnet_mapping = {
    for s in var.subnets : s.subnet.tags["PrevId"] => s.subnet.id
    if contains(keys(s.subnet.tags), "PrevId")
  }

  new_subnets = {
    for subnet, subnet_ids in var.vpce_subnets_with_legacy_relations : 
    subnet => [for subnet_id in subnet_ids : lookup(local.subnet_mapping, subnet_id, subnet_id)]
  }
}

output "vpce_subnets_with_legacy_relations" {
  value = var.vpce_subnets_with_legacy_relations
}

output "subnet_mapping" {
  value = local.subnet_mapping
}

output "new_subnets" {
  value = local.new_subnets
}