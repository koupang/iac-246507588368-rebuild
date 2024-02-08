# variable "route_table_id" = "The ID of the routing table to associate with the subnet."
# variable "destination_cidr_block" = "The CIDR block of the destination."
# variable "destination_ipv6_cidr_block" = "The IPv6 CIDR block of the destination."
# variable "destination_prefix_list_id" = "The prefix list ID of the destination."
# # variable "carrier_gateway_id" = "The ID of a carrier gateway."
# # variable "core_network_arn" = "The ARN of a core network."
# # variable "egress_only_gateway_id" = "The ID of an egress-only gateway."
# variable "gateway_id" = "The ID of a VPN or internet gateway."
# variable "nat_gateway_id" = "The ID of a NAT gateway."
# # variable "local_gateway_id" = "The ID of a local gateway."
# variable "network_interface_id" = "The ID of a network interface."
# variable "transit_gateway_id" = "The ID of a transit gateway."
# variable "vpc_endpoint_id" = "The ID of an endpoint."
# # variable "vpc_peering_connection_id" = "The ID of a VPC peering connection."

variable "route_arguments" {
  description = "Arguments for the route."
  type = object({
    route_table_id = string

    destination_cidr_block = optional(string)
    destination_ipv6_cidr_block = optional(string)
    destination_prefix_list_id = optional(string)

    # carrier_gateway_id = string
    # core_network_arn = string
    # egress_only_gateway_id = string
    gateway_id = optional(string)
    nat_gateway_id = optional(string)
    # local_gateway_id = string
    network_interface_id = optional(string)
    transit_gateway_id = optional(string)
    vpc_endpoint_id = optional(string)
    vpc_peering_connection_id = optional(string)
  })
}