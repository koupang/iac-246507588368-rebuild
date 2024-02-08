variable "enable_assume_role" {
  type    = bool
  default = false
  description = "The boolean variable whether to enable assume role or not."
}
variable "role_arn" {
  type        = string
  default     = ""
  description = "The ARN of the role to assume"
}
variable "vpc" {
  type = object({
    name                             = string
    cidr_block                       = string
    tags                             = map(string)
    region                           = string
    enable_dns_hostnames             = bool
    assign_generated_ipv6_cidr_block = bool
  })
  default = null
  description = "VPC values. Previous ID would be added in the tag."

}

variable "ipv4_cidr_block_associations" {
  type = map(object({
    cidr_block = string
  }))
  default = null
  description = "ipv4_cidr_block_associations values."
}

variable "subnets" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
  default = null
  description = "Subnet values. Previous ID would be added in the tag."
}

variable "transit_gateway_vpc_attachments" {
  type = map(object({
    name                    = string
    prev_transit_gateway_id = string
    prev_subnet_ids         = list(string)
    tags                    = map(string)
  }))
  default = null
  description = "transit_gateway_vpc_attachments values."
}

variable "vpn_gateways" {
  type = map(object({
    vpc_id            = string
    amazon_side_asn   = string
    availability_zone = string
    tags              = map(string)
  }))
  default = null
  description = "vpn_gateways values. Previous ID would be added in the tag."  
}

variable "internet_gateways" {
  type = map(object({
    tags = map(string)
  }))
  default = null
  description = "internet_gateways values. Previous ID would be added in the tag."  
}

variable "nat_gateways" {
  type = map(object({
    name               = string
    connectivity_type  = string
    prev_subnet_id     = string
    prev_allocation_id = string
    tags               = map(string)
  }))
  default = null
  description = "nat_gateways values. Previous ID would be added in the tag."  
}

variable "eips" {
  type = map(object({
    domain               = string
    network_border_group = string
    public_ipv4_pool     = string
    tags                 = map(string)
  }))
  default = null
  description = "eips values. Previous ID would be added in the tag."  
}

variable "network_acls" {
  type = map(object({
    name            = string
    vpc_id          = string
    prev_subnet_ids = list(string)
    ingress = map(object({
      action          = string
      protocol        = string
      from_port       = number
      to_port         = number
      cidr_block      = string
      ipv6_cidr_block = string
      icmp_type       = number
      icmp_code       = number
    })),
    egress = map(object({
      action          = string
      protocol        = string
      from_port       = number
      to_port         = number
      cidr_block      = string
      ipv6_cidr_block = string
      icmp_type       = number
      icmp_code       = number
    })),
    tags = map(string)
  }))
  default = null
  description = "network_acls values. Previous ID would be added in the tag."  
}

variable "security_groups" {
  type = map(object({
    name        = string
    description = string
    vpc_id      = string

    tags = map(string)
  }))
  default = null
  description = "security_groups values. Previous ID would be added in the tag."  
}

variable "security_group_rules" {
  type = map(object({
    type              = string
    security_group_id = string
    description       = string
    from_port         = number
    to_port           = number
    protocol          = string
    cidr_blocks       = list(string)
    ipv6_cidr_blocks  = list(string)
    prefix_list_ids   = list(string)
    self              = bool
    security_groups   = list(string)
  }))
  default = {}
  description = "security_group_rules values."  
}

variable "route_tables" {
  type = map(object({
    tags = map(string)
    name = string
  }))
  default = {}
  description = "route_tables values. Previous ID would be added in the tag."  
}

variable "routes" {
  type = map(object({
    route_table_id = string

    cidr_block                 = string
    ipv6_cidr_block            = string
    destination_prefix_list_id = string

    # carrier_gateway_id = string
    # core_network_arn = string
    # egress_only_gateway_id = string
    gateway_id     = string
    nat_gateway_id = string
    # local_gateway_id = string
    network_interface_id = string
    transit_gateway_id   = string
    vpc_endpoint_id      = string
    # vpc_peering_connection_id = string
  }))
  default = {}
  description = "route values of route table. VPC Peering Connection related routes are created later."  
}

variable "main_route_table_associations" {
  type = map(object({
    prev_route_table_id = string
    id                  = string
  }))
  default = {}
  description = "Main route table association values. This association is for designating the main route table of VPC"  

}

variable "route_table_associations" {
  type = map(object({
    id                  = string
    prev_route_table_id = string
    prev_subnet_id      = string
  }))
  default = {}
  description = "Route table association values. This association is for mapping with subnets."  

}

variable "vpc_endpoints" {
  type = map(object({
    name                    = string
    service_name            = string
    vpc_endpoint_type       = string
    prev_subnet_ids         = list(string)
    prev_security_group_ids = list(string)
    policy                  = string
    private_dns_enabled     = bool
    prev_route_table_ids    = list(string)
    tags                    = map(string)
    dns_options = list(object({
      dns_record_ip_type                             = string
      private_dns_only_for_inbound_resolver_endpoint = bool
    }))

  }))
  default = {}
}

variable "vpc_flow_logs" {
  type = map(object({
    destination_options = list(object({
      file_format                = string
      hive_compatible_partitions = bool
      per_hour_partition         = bool
    }))
    log_destination               = string
    log_destination_type          = string
    log_format                    = string
    max_aggregation_interval      = number
    name                          = string
    subnet_id                     = string
    tags                          = map(string)
    traffic_type                  = string
    transit_gateway_attachment_id = string
    transit_gateway_id            = string
    vpc_id                        = string
  }))

  default = {}
}

variable "network_interfaces" {
  type = map(object({
    name                 = string
    description          = string
    prev_security_groups = list(string)
    prev_subnet_id       = string
    # interface_type       = string

    tags = map(string)
  }))
  default = {}
}
