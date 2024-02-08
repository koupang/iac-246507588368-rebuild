locals {
  subnets_with_prev_id = [for s in var.subnets : s if contains(keys(s.subnet.tags), "PrevId")]
  subnet_mapping = { for s in local.subnets_with_prev_id : s.subnet.tags.PrevId => s.subnet.id }

  nat_new_set = {
    for n, subnet_id in var.nat_set : n => lookup(local.subnet_mapping, subnet_id, subnet_id)
  }
}

output "subnets_with_prev_id" {
  value = local.subnets_with_prev_id
}

output "subnet_mapping" {
  value = local.subnet_mapping
}

output "nat_set" {
  value = var.nat_set
}

output "nat_new_set" {
  value = local.nat_new_set
}