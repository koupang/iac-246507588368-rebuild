locals {
  subnets_with_prev_id = [for s in var.subnets : s if contains(keys(s.subnet.tags), "PrevId")]
  subnet_mapping = { for s in local.subnets_with_prev_id : s.subnet.tags.PrevId => s.subnet.id }

  tgva_new_set = {
    for k, subnet_ids in var.tgva_set :
      k => [for subnet_id in subnet_ids : lookup(local.subnet_mapping, subnet_id, subnet_id)]}
}

output "subnet_mapping" {
  value = local.subnet_mapping
}

output "tgva_set" {
  value = var.tgva_set
}

output "newset" {
  value = local.tgva_new_set
}