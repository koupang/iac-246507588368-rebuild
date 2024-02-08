variable "subnets" {
  type = map(object({
    subnet = any
  }))
}

variable "nacl_subnets_with_legacy_relations" {
  description = "A list of subnet IDs for value of the previous network ACL"
  type        = map(list(string))
}
