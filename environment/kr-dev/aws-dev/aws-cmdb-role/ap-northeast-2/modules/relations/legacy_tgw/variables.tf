variable "subnets" {
  type = map(object({
    subnet = any
  }))
}

variable "tgw_attachment_subnets_with_legacy_relations" {
  description = "A list of subnet IDs for value of the previous transit gateway attachment"
  type        = map(list(string))
}