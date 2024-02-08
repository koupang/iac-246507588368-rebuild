variable "rt_subnets_with_legacy_relations" {
  type    = map(string)
}

variable "subnets" {
  type = map(object({
    subnet = any
  }))
}