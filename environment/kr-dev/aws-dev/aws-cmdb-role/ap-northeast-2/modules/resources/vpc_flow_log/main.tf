data "aws_ec2_transit_gateway" "this" {

  count = var.transit_gateway_id != null ? 1 : 0
  filter {
    name   = "tag:PrevId"
    values = [var.transit_gateway_id] // previous transit gateway id
  }
}

resource "aws_flow_log" "vpc-flow-logs" {

  // One of eni_id, subnet_id, transit_gateway_id, transit_gateway_attachment_id, or vpc_id must be specified.

  count = var.eni_id != null || var.subnet_id != null || var.transit_gateway_id != null || var.transit_gateway_attachment_id != null ? 1 : 0

  deliver_cross_account_role    = var.deliver_cross_account_role //null
  eni_id                        = var.eni_id                     // null
  iam_role_arn                  = var.iam_role_arn               // null
  log_destination               = var.log_destination            // "arn:aws:s3:::s3-simple-vpc-flow-logs"
  log_destination_type          = var.log_destination_type       // "s3"
  log_format                    = var.log_format                 // "$${version} $${account-id} $${interface-id} $${srcaddr} $${dstaddr} $${srcport} $${dstport} $${protocol} $${packets} $${bytes} $${start} $${end} $${action} $${log-status}"
  max_aggregation_interval      = var.max_aggregation_interval   // 600
  subnet_id                     = var.subnet_id
  tags                          = var.tags
  traffic_type                  = var.traffic_type
  transit_gateway_attachment_id = var.transit_gateway_attachment_id
  transit_gateway_id            = data.aws_ec2_transit_gateway.this[count.index].id != null ? data.aws_ec2_transit_gateway.this[count.index].id : null
  vpc_id                        = var.vpc_id
  # eni_id                        = var.eni_id

  destination_options {
    file_format                = var.destination_options[0].file_format                // "plain-text"
    hive_compatible_partitions = var.destination_options[0].hive_compatible_partitions // true
    per_hour_partition         = var.destination_options[0].per_hour_partition         // true
  }
}

