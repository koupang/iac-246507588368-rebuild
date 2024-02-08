
variable "transit_gateway_vpc_attachments" {
  type = map(object({
    transit_gateway_vpc_attachment = any
  }))
  default = null
}
