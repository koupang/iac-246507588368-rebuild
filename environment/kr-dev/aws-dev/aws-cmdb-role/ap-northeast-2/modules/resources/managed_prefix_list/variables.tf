variable "address_family" {
  type        = string
  description = "(optional) describe your variable"
}

variable "entry" {
  description = "A list of entries (CIDR blocks) for the prefix list"
  type = map(object({
    cidr        = string,
    description = string
    }
  ))
}

variable "max_entries" {
  description = "The maximum number of entries for the prefix list"
  type        = number
}


variable "name" {
  description = "The name of the prefix list"
  type        = string
}

variable "tags" {
  description = "(Optional) A map of tags to add to all resources."
  type        = map(string)
  default     = {}
  nullable    = false
}