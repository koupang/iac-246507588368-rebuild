locals {
  new_subnet_map = {
    for subnet in var.subnets : coalesce(subnet.subnet.tags["PrevId"], "tag PrevId not exist") => subnet.subnet.id
    if contains(keys(subnet.subnet.tags), "PrevId")
  }

}

output "new_subnet_map" {
  value = local.new_subnet_map
}
