variable "vpc_id" {
  description = "The VPC ID to create in."
  type = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type = map(string)
}