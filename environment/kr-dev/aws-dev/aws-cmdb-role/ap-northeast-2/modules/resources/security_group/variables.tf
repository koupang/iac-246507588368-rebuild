variable "name" {
  type        = string
  description = "The name of the security group."
}

variable "description" {
  type        = string
  description = "The description of the security group."
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID for the security group."
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the security group."
}
