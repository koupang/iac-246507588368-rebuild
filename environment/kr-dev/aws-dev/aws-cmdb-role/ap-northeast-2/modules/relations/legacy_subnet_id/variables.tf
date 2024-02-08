variable "subnets" {
  type = map(object({
    subnet = any
  }))
}