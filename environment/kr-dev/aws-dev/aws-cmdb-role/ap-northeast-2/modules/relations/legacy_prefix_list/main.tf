locals {
  //filtering the prefix lists which has prevId in tags. These resources indicate the newly created resource based on imported terraform state file.
  //pl_mapping = "{pl-old1 : pl-new1, pl-old2 : pl-new2}"

  pl_mapping = {
    for pl in data.aws_ec2_managed_prefix_list.this : pl.tags["PrevId"] => pl.id
    if contains(keys(pl.tags), "PrevId")
  }

  // Update prefix_list_ids for security group rules 
  new_prefix_list_ids = {
    for security_group_rule, prefix_list_ids in var.prefix_list_ids_with_legacy_relations :
  security_group_rule => [for prefix_list_id in prefix_list_ids : lookup(local.pl_mapping, prefix_list_id, prefix_list_id)] }
}

output "pl_mapping" {
  value = local.pl_mapping
}

output "prefix_list_ids_with_legacy_relations" {
  value = var.prefix_list_ids_with_legacy_relations
}

output "new_prefix_list_ids" {
  value = local.new_prefix_list_ids
}
