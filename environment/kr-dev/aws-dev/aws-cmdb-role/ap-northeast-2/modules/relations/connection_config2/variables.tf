variable "tgva_set" {
  type    = map(list(string))
}

variable "subnets" {
  type = map(object({
    subnet = any
  }))
}