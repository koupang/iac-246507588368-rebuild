variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "vpc_peerings" {
  type = map(object({
    name = string
    requester = object({
      vpc_id = string
      tags   = map(string)
    })
    accepter = object({
      vpc_id = string
      tags   = map(string)
    })
  }))
}