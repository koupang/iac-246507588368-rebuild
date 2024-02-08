variable "enable_assume_role" {
  type    = bool
  default = false
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
}

variable "ipv4_cidr_block_associations" {
  type = map(object({
    cidr_block = string
  }))
  default = null
}

variable "subnets" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
    tags              = map(string)
  }))
  default = null
}

variable "transit_gateway_vpc_attachments" {
  type = map(object({
    name                    = string
    prev_transit_gateway_id = string
    prev_subnet_ids         = list(string)
    tags                    = map(string)
  }))
  default = null
}

variable "vpn_gateways" {
  type = map(object({
    vpc_id            = string
    amazon_side_asn   = string
    availability_zone = string
    tags              = map(string)
  }))
  default = null
}
variable "internet_gateways" {
  type = map(object({
    tags = map(string)
  }))
  default = null
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
}

variable "eips" {
  type = map(object({
    domain               = string
    network_border_group = string
    public_ipv4_pool     = string
    tags                 = map(string)
  }))
  default = null
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
}

variable "security_groups" {
  type = map(object({
    name        = string
    description = string
    vpc_id      = string

    tags = map(string)
  }))
  default = null
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
}

variable "route_tables" {
  type = map(object({
    tags = map(string)
    name = string
  }))
  default = {}
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
}

variable "main_route_table_associations" {
  type = map(object({
    prev_route_table_id = string
    id                  = string
  }))
  default = {}
}

variable "route_table_associations" {
  type = map(object({
    id                  = string
    prev_route_table_id = string
    prev_subnet_id      = string
  }))
  default = {}
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
