

locals {
  new_tgw_vpc_attachment_map = {
    for attachment in var.transit_gateway_vpc_attachments : coalesce(attachment.transit_gateway_vpc_attachment.tags["PrevId"], "tag PrevId not exist") => attachment.transit_gateway_vpc_attachment.id
    if contains(keys(attachment.transit_gateway_vpc_attachment.tags), "PrevId")
  }

}

output "new_tgw_vpc_attachment_map" {
  value = local.new_tgw_vpc_attachment_map
}

