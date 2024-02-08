locals {
  subnets_with_prev_id = [for s in var.subnets : s if contains(keys(s.subnet.tags), "PrevId")]
  subnet_mapping       = { for s in local.subnets_with_prev_id : s.subnet.tags.PrevId => s.subnet.id }

  new_tgw_attachment_subnets = {
    for k, subnet_ids in var.tgw_attachment_subnets_with_legacy_relations :
  k => [for subnet_id in subnet_ids : lookup(local.subnet_mapping, subnet_id, subnet_id)] }
}

output "subnet_mapping" {
  value = local.subnet_mapping
}

output "tgw_attachment_subnets_with_legacy_relations" {
  value = var.tgw_attachment_subnets_with_legacy_relations
}

output "new_tgw_attachment_subnets" {
  value = local.new_tgw_attachment_subnets
}