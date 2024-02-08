variable "type" {
  type        = string
  description = "Type of rule being created. Valid options are ingress (inbound) or egress (outbound)."
}

variable "security_group_id" {
  type        = string
  description = "Security group to apply this rule to."
}

variable "description" {
  type        = string
  description = "Description of the rule."
}

variable "from_port" {
  type        = string
  description = "Start port (or ICMP type number if protocol is 'icmp' or 'icmpv6')."
}

variable "to_port" {
  type        = string
  description = "End port (or ICMP code if protocol is 'icmp' or 'icmpv6')."
}

variable "protocol" {
  type        = string
  description = "Protocol. Valid values are 'tcp', 'udp', 'icmp' or 'icmpv6'."
}

variable "cidr_blocks" {
  type        = list(string)
  description = "List of CIDR blocks to allow access to."
  default     = []
}

variable "ipv6_cidr_blocks" {
  type        = list(string)
  description = "List of IPv6 CIDR blocks to allow access to."
  default     = []
}

variable "prefix_list_ids" {
  type        = list(string)
  description = "List of prefix list IDs to allow access to."
}

variable "self" {
  type        = bool
  description = "Whether the security group itself will be added as a source to this ingress rule. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or source_security_group_id."
  default     = false
}

variable "source_security_groups" {
  type        = list(string)
  description = "Security group id to allow access to/from, depending on the type. Cannot be specified with cidr_blocks, ipv6_cidr_blocks, or self."
  default     = []
}