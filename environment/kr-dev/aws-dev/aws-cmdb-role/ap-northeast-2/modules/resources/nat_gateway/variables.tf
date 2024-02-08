variable "subnet_id" {
  description = "The Subnet ID of the subnet in which to place the NAT Gateway."
  type = string
}

variable "connectivity_type" {
  description = "Connectivity type for the NAT Gateway. Valid values are private and public. Defaults to public."
  type = string
}

variable "allocation_id" {
  description = "The Allocation ID of the Elastic IP address for the NAT Gateway. Required for connectivity_type of public."
  type = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type = map(string)
}