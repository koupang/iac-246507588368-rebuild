variable "service_name" {
  description = "The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service>"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used."
  type        = string
}

variable "route_table_ids" {
  description = "One or more route table IDs. Applicable for endpoints of type Gateway."
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "The ID of one or more subnets in which to create a network interface for the endpoint. Applicable for endpoints of type GatewayLoadBalancer and Interface."
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "The ID of one or more security groups to associate with the network interface. Required for endpoints of type Interface."
  type        = list(string)
  default     = []
}

variable "vpc_endpoint_type" {
  description = "The type of endpoint. One of Gateway, GatewayLoadBalancer, Interface."
  type        = string
}

variable "private_dns_enabled" {
  description = "Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface."
  type        = bool
  default     = false
}

variable "policy" {
  description = "A policy to attach to the endpoint that controls access to the service. This is a JSON formatted string. Defaults to full access. All Gateway and some Interface endpoints support policies."
  type        = string
  default     = null
}

variable "dns_options" {
  description = "DNS options for the VPC endpoint"
  type = list(object({
    dns_record_ip_type   = string
    private_dns_only_for_inbound_resolver_endpoint = bool
  }))
  default = []
}


variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}