locals {
  //filtering the security groups which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  //sg_mapping = {sg-old1 = "sg-new1"}
  sg_mapping = {
    for sg in var.security_groups : sg.security_group.tags["PrevId"] => sg.security_group.id
    if contains(keys(sg.security_group.tags), "PrevId")
  }

  new_security_groups = {
    for security_group, security_group_ids in var.eni_sg_with_legacy_relations :
    security_group => [ for security_group_id in security_group_ids : lookup(local.sg_mapping, security_group_id, security_group_id)]
  }
}

output "eni_sg_with_legacy_relations" {
  value = var.eni_sg_with_legacy_relations
}

output "sg_mapping" {
  value = local.sg_mapping
}

output "new_security_groups" {
  value = local.new_security_groups
}