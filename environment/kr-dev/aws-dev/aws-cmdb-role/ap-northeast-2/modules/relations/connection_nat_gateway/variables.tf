variable "nat_set" {
  type    = map(string)
}

variable "subnets" {
  type = map(object({
    subnet = any
  }))
}