variable "security_groups" {
  type = map(object({
    security_group = any
  }))
  default = null
}

variable "security_groups_with_legacy_relations" {
  description = "A list of security group ID for value of the previous security group rules"
  type        = map(string)
}

variable "source_security_group_ids_with_legacy_relations" {
  description = "A list of source security group ID for value of the previous security group rules"
  type        = map(list(string))
}
