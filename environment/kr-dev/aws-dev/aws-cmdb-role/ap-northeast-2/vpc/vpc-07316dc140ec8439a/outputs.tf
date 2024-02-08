# output "module_subnets" {
#   value = merge(module.subnet)
# }

# output "module_security_group_rule" {
#   value = merge(module.security_group_rule)
# }

output "vpc" {
  description = "Old & new ID of VPC"
  value = module.vpc.old_new
}

output "subnet" {
  description = "Old & new ID list of subnet"
  value = [ for k, v in module.subnet : v.old_new ]
}

output "network_acl" {
  description = "Old & new ID list of network_acl"
  value = [ for k, v in module.network_acl : v.old_new ]
}

output "transit_gateway_vpc_attachment" {
  description = "Old & new ID list of transit_gateway_vpc_attachment"
  value = [ for k, v in module.transit_gateway_vpc_attachment : v.old_new ]
}

output "vpn_gateway" {
  description = "Old & new ID list of vpn_gateway"
  value = [ for k, v in module.vpn_gateway : v.old_new ]
}

output "internet_gateway" {
  description = "Old & new ID list of internet_gateway"
  value = [ for k, v in module.internet_gateway : v.old_new ]
}

output "eip" {
  description = "Old & new ID list of eip"
  value = [ for k, v in module.eip : v.old_new ]
}

output "nat_gateway" {
  description = "Old & new ID list of nat_gateway"
  value = [ for k, v in module.nat_gateway : v.old_new ]
}

output "security_group" {
  description = "Old & new ID list of security_group"
  value = [ for k, v in module.security_group : v.old_new ]
}

output "route_table" {
  description = "Old & new ID list of route_table"
  value = [ for k, v in module.route_table : v.old_new ]
}

output "vpc_endpoint" {
  description = "Old & new ID list of vpc_endpoint"
  value = [ for k, v in module.vpc_endpoint : v.old_new ]
}

output "vpc_flow_logs" {
  description = "Old & new ID list of vpc_flow_logs"
  value = [ for k, v in module.vpc_flow_logs : v.old_new ]
}

output "network_interface" {
  description = "Old & new ID list of network_interface"
  value = [ for k, v in module.network_interface : v.old_new ]
}