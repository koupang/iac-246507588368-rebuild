module "tgw_vpc_attachment_id" {

  source = "../"

  transit_gateway_vpc_attachments = {
    "front" = {
      "transit_gateway_vpc_attachment" = {
        "appliance_mode_support" = "disable"
        "dns_support"            = "enable"
        "id"                     = "tgw-attach-0679f88c61a3a477a"
        "ipv6_support"           = "disable"
        "subnet_ids" = toset([
          "subnet-0499c6290a632db49",
          "subnet-054aacf9c6b7d6751",
        ])
        "tags" = tomap({
          "ImportedDate" = "2023-10-27"
          "Importor"     = "xhoto"
          "Name"         = "front"
          "PrevId"       = "tgw-attach-0c62295da6433fb02"
        })
        "tags_all" = tomap({
          "ImportedDate" = "2023-10-27"
          "Importor"     = "xhoto"
          "Name"         = "front"
          "PrevId"       = "tgw-attach-0c62295da6433fb02"
        })
        "transit_gateway_default_route_table_association" = true
        "transit_gateway_default_route_table_propagation" = true
        "transit_gateway_id"                              = "tgw-03be28ad5bd41bdae"
        "vpc_id"                                          = "vpc-057e03ee4c7fb2d8a"
        "vpc_owner_id"                                    = "793394343433"
      }
    }
  }
}

output "new_tgw_vpc_attachment_map" {
  value = module.tgw_vpc_attachment_id.new_tgw_vpc_attachment_map
}

