variable "name" {
  type        = string
  description = "(optional) The name of the VPN gateway."
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "(Optional) The VPC ID to create in."
  default     = ""
}

variable "availability_zone" {
  type        = string
  description = "(Optional) The Availability Zone for the virtual private gateway."
  default     = ""
}

variable "amazon_side_asn" {
  type        = number
  description = "(optional) The Autonomous System Number (ASN) for the Amazon side of the gateway"
  default     = 64512

  validation {
    condition     = var.amazon_side_asn == 7224 || var.amazon_side_asn == 9059 || var.amazon_side_asn == 10124 || var.amazon_side_asn == 17493 || (var.amazon_side_asn >= 64512 && var.amazon_side_asn <= 65534) || (var.amazon_side_asn >= 4200000000 && var.amazon_side_asn <= 4294967294)
    error_message = "Invalid value for amazon_side_asn. It must be 7224, 9059, 10124, 17493, or in the range 64512 to 65534 or 4200000000 to 4294967294."
  }
}

variable "tags" {
  description = "(Optional) A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
  nullable    = false
}