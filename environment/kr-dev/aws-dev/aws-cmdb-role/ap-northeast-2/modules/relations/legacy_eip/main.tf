locals {
  //filtering the EIPs which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  //eip_mapping = {eip-old1 = "eip-new1"}
  eip_mapping = { 
    for e in var.eips : e.eip.tags.PrevId => e.eip.id
    if contains(keys(e.eip.tags), "PrevId")
  }

  //change old EIP ID to new EIP ID
  new_eips = {
    for e, allocation_id in var.eips_with_legacy_relations : e => lookup(local.eip_mapping, allocation_id, allocation_id)
  }
}

output "eip_mapping" {
  value = local.eip_mapping
}

output "eips_with_legacy_relations" {
  value = var.eips_with_legacy_relations
}

output "new_eips" {
  value = local.new_eips
}