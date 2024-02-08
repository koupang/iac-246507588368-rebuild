variable "associations_rt_with_legacy_relations" {
  type    = map(string)
}

variable "route_tables" {
  type = map(object({
    route_table = any
  }))
}