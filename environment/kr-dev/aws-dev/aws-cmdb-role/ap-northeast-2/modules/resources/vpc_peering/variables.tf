variable "name" {
  type = string
}

variable "requester" {
  type = object({
    region = string
    vpc_id = string
    tags   = map(string)
  })
}

variable "accepter" {
  type = object({
    region = string
    vpc_id = string
    tags   = map(string)
  })
}

variable "test" {
  type        = string
  description = "(optional) describe your variable"
  default     = ""
}