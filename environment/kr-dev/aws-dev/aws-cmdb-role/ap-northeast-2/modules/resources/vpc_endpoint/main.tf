resource "aws_vpc_endpoint" "this" {
  vpc_id              = var.vpc_id
  service_name        = var.service_name
  route_table_ids     = var.vpc_endpoint_type == "Gateway" ? var.route_table_ids : []
  subnet_ids          = var.vpc_endpoint_type == "Interface" || var.vpc_endpoint_type == "GatewayLoadBalancer" ? var.subnet_ids : []
  security_group_ids  = var.vpc_endpoint_type == "Interface" ? var.security_group_ids : []
  vpc_endpoint_type   = var.vpc_endpoint_type
  private_dns_enabled = var.vpc_endpoint_type == "Interface" ? var.private_dns_enabled : false
  policy              = var.policy

  dynamic "dns_options" {
    for_each = var.vpc_endpoint_type == "Interface" ? var.dns_options : []

    iterator = option
    content {
      dns_record_ip_type                             = option.value.dns_record_ip_type
      private_dns_only_for_inbound_resolver_endpoint = option.value.private_dns_only_for_inbound_resolver_endpoint
    }
  }

  tags = var.tags
}