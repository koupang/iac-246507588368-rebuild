data "aws_ec2_transit_gateway" "this" {

  count = (var.route_arguments.transit_gateway_id != null) ? 1 : 0
  filter {
    name   = "tag:PrevId"
    values = [var.route_arguments.transit_gateway_id] // previous transit gateway id
  }
  filter {
    name   = "state"
    values = ["available"]
  }
}

# handle data.aws_ec2_transit_gateway.this[0].id with try function to avoid an error
locals {
  transit_gateway_id = try(data.aws_ec2_transit_gateway.this[0].id, null)
}

resource "aws_route" "this" {
  route_table_id = var.route_arguments.route_table_id

  destination_cidr_block      = var.route_arguments.destination_cidr_block
  destination_ipv6_cidr_block = var.route_arguments.destination_ipv6_cidr_block
  destination_prefix_list_id  = var.route_arguments.destination_prefix_list_id

  # carrier_gateway_id        = var.carrier_gateway_id
  # core_network_arn          = var.core_network_arn
  # egress_only_gateway_id    = var.egress_only_gateway_id
  gateway_id     = var.route_arguments.gateway_id
  nat_gateway_id = var.route_arguments.nat_gateway_id
  # local_gateway_id          = var.local_gateway_id
  network_interface_id = var.route_arguments.network_interface_id
  transit_gateway_id   = local.transit_gateway_id
  vpc_endpoint_id      = var.route_arguments.vpc_endpoint_id

  vpc_peering_connection_id = var.route_arguments.vpc_peering_connection_id
}
