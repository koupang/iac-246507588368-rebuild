variable "route_table_id_with_legacy_relations" {
  type    = map(string)
}

variable "route_tables" {
  type = map(object({
    route_table = any
  }))
}