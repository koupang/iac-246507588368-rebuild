variable "enable_assume_role" {
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

variable "vpc_peering_routes" {
  type = map(object({
    route_table_id = string

    cidr_block                 = string
    ipv6_cidr_block            = string
    destination_prefix_list_id = string

    vpc_peering_connection_id = string
  }))
  default = {}
}