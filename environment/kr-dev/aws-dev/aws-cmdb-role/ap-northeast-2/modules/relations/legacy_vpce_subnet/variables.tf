variable "vpce_subnets_with_legacy_relations" {
  type    = map(list(string))
}

variable "subnets" {
  type = map(object({
    subnet = any
  }))
}