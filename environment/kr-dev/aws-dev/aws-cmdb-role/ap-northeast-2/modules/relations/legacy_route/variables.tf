variable "route_tables_with_legacy_relations" {
  type = map(string)
}

variable "route_prefix_list_ids_with_legacy_relations" {
  type = map(string)
}

variable "route_gateways_with_legacy_relations" {
  type = map(string)
}

variable "route_nat_gateways_with_legacy_relations" {
  type = map(string)
}

variable "route_network_interfaces_with_legacy_relations" {
  type = map(string)
}

variable "route_vpc_endpoints_with_legacy_relations" {
  type = map(string)
}

variable "route_tables" {
  type = map(object({
    route_table = any
  }))
}

variable "network_interfaces" {
  type = map(object({
    network_interface = any
  }))
}

variable "internet_gateways" {
  type = map(object({
    internet_gateway = any
  }))
}

variable "vpn_gateways" {
  type = map(object({
    vpn_gateway = any
  }))
}

variable "nat_gateways" {
  type = map(object({
    nat_gateway = any
  }))
}

variable "vpc_endpoints" {
  type = map(object({
    vpc_endpoint = any
  }))
}
