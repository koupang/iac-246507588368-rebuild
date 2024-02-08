variable "enable_assume_role" {
  description = "The boolean variable whether to enable assume role or not."
  type    = bool
  default = false
}
variable "role_arn" {
  type        = string
  default     = ""
  description = "The ARN of the role to assume"
}

variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "vpc_peerings" {
  description = "VPC peerings values. Previous ID would be added in the tag."
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
  default = {}
}