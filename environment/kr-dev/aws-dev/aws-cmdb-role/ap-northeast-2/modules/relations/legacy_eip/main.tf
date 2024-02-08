locals {
  eips_with_prev_id = [for e in var.eips : e if contains(keys(e.eip.tags), "PrevId")]
  eip_id_mapping = { for e in local.eips_with_prev_id : e.eip.tags.PrevId => e.eip.id }

  eip_new_set = {
    for e, allocation_id in var.eip_set : e => lookup(local.eip_id_mapping, allocation_id, allocation_id)
  }
}

output "eips_with_prev_id" {
  value = local.eips_with_prev_id
}

output "eip_id_mapping" {
  value = local.eip_id_mapping
}

output "eip_set" {
  value = var.eip_set
}

output "eip_new_set" {
  value = local.eip_new_set
}