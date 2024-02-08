variable "eni_sg_with_legacy_relations" {
  type    = map(list(string))
}

variable "security_groups" {
  type = map(object({
    security_group = any
  }))
}