variable "enable_assume_role" {
  type    = bool
  default = false
  description = "The boolean variable whether to enable assume role or not."
}

variable "role_arn" {
  type        = string
  default     = ""
  description = "The ARN of the role to assume"
}
variable "region" {
  type    = string
  default = "ap-northeast-2"
  description = "Region for resources to be provisioned."
}

variable "transit_gateways" {
  type = map(object({
    name        = string
    description = string
    tags        = map(string)
  }))
  description = "Transit Gateway values. Previous ID would be added in the tag."
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
  description = "Managed prefix list values. Previous ID would be added in the tag."
}

variable "s3_buckets_for_vpc_flow_logs" {
  type = map(object({
    bucket              = string
    force_destroy       = bool
    object_lock_enabled = bool
    tags                = map(string)
  }))

  default = {}
  description = "Values for S3 bucket storing VPC flow logs."
}