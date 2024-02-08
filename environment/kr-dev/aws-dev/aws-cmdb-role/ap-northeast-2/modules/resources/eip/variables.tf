variable "domain" {
  description = "Indicates if this EIP is for use in VPC (vpc)."
  type = string
}

variable "network_border_group" {
  description = "Location from which the IP address is advertised. Use this parameter to limit the address to this location."
  type = string
}

variable "public_ipv4_pool" {
  description = "EC2 IPv4 address pool identifier or 'amazon'. This option is only available for VPC EIPs."
  type = string
}

variable "tags" {
  description = "Map of tags to assign to the resource."
  type = map(string)
}