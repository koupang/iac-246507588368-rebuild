variable "description" {
  description = "The Description of network interface"
  type = string
}

variable "subnet_id" {
  description = "The Subnet ID of the subnet in which to place the Network Interface."
  type = string
}

variable "security_groups" {
  description = "List of security group IDs to assign to the ENI."
  type = list(string)
}

# variable "interface_type" {
#   description = "Type of network interface to create. Set to efa for Elastic Fabric Adapter. Changing interface_type will cause the resource to be destroyed and re-created."
#   type = string
# }

variable "tags" {
  description = "A map of tags to assign to the resource."
  type = map(string)
}