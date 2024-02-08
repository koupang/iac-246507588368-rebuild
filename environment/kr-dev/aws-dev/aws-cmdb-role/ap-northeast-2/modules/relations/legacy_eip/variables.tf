variable "eips_with_legacy_relations" {
  description = "Set of old EIPs"
  type    = map(string)
}

variable "eips" {
  type = map(object({
    eip = any
  }))
}