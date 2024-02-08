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

variable "transit_gateways" {
  type = map(object({
    name        = string
    description = string
    tags        = map(string)
  }))
  default = {}
}
variable "managed_prefix_lists" {
  type = map(object({
    address_family = string
    entry = map(object({
      cidr        = string
      description = string
    }))
    max_entries = number
    name        = string
    tags        = map(string)
  }))
  default = {}
}

variable "s3_buckets_for_vpc_flow_logs" {
  type = map(object({
    bucket              = string
    force_destroy       = bool
    object_lock_enabled = bool
    tags                = map(string)
  }))

  default = {}
}