variable "vpc_id" {
  description = "The VPC ID of the Route table."
  type = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type = map(string)
}