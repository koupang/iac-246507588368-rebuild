locals {
  //filtering the security groups which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  //sg_mapping = {sg-0117deaa2fa5cd09b = "sg-05f6ed8ceb1b6f54f"}
  sg_mapping = {
    for sg in var.security_groups : sg.security_group.tags["PrevId"] => sg.security_group.id
    if contains(keys(sg.security_group.tags), "PrevId")
  }

  //var.security_groups_with_legacy_relations: {"ingress-from-53-tcp" : "sg-old1"}
  //lookup local.sg_mapping and if the key is same with security_group_id, then replace the value of sg_mapping, or just leave the security_group_id.
  new_security_groups = {
    for security_group_rule, security_group_id in var.security_groups_with_legacy_relations : security_group_rule => lookup(local.sg_mapping, security_group_id, security_group_id)
  }

  // Updated source_security_group_id list for security group rules 
  new_source_security_group_ids = {
    for security_group_rule, security_group_ids in var.source_security_group_ids_with_legacy_relations :
  security_group_rule => [for security_group_id in security_group_ids : lookup(local.sg_mapping, security_group_id, security_group_id)] }
}

output "sg_mapping" {
  value = local.sg_mapping
}

output "security_groups_with_legacy_relations" {
  value = var.security_groups_with_legacy_relations
}

output "source_security_group_ids_with_legacy_relations" {
  value = var.source_security_group_ids_with_legacy_relations
}

output "new_security_groups" {
  value = local.new_security_groups
}

output "new_source_security_group_ids" {
  value = local.new_source_security_group_ids
}

