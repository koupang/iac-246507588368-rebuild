locals {
  //filtering the subnets which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  //subnet_mapping = {subnet-old1 = "subnet-new1"}
  subnet_mapping = {
    for s in var.subnets : s.subnet.tags.PrevId => s.subnet.id 
    if contains(keys(s.subnet.tags), "PrevId")
  }

  //change old subnet ID to new subnet ID
  new_nat_subnets = {
    for n, subnet_id in var.nat_subnets_with_legacy_relations : n => lookup(local.subnet_mapping, subnet_id, subnet_id)
  }
}

output "subnet_mapping" {
  value = local.subnet_mapping
}

output "nat_subnets_with_legacy_relations" {
  value = var.nat_subnets_with_legacy_relations
}

output "new_nat_subnets" {
  value = local.new_nat_subnets
}