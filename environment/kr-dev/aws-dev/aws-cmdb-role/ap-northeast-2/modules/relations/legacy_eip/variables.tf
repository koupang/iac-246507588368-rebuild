variable "eip_set" {
  type    = map(string)
}

variable "eips" {
  type = map(object({
    eip = any
  }))
}