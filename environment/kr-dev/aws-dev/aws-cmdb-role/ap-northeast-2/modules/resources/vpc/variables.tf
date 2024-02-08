variable "name" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "assign_generated_ipv6_cidr_block" {
  type = bool
}