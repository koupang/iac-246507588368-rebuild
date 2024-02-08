module "vpc_flow_logs" {
  source                     = "../.."
  deliver_cross_account_role = null
  eni_id                     = null
  iam_role_arn               = null
  log_destination            = "arn:aws:s3:::s3-simple-vpc-flow-logs-f8eveviq"
  log_destination_type       = "s3"
  #   log_format                 = "${account-id} ${interface-id} ${srcaddr} ${pkt-srcaddr} ${dstaddr} ${pkt-dstaddr} ${srcport} ${dstport} ${protocol} ${packets} ${bytes} ${start} ${end} ${action} ${pkt-src-aws-service} ${flow-direction} ${log-status} ${vpc-id} ${tcp-flags} ${traffic-path} ${type}"
  max_aggregation_interval = 60
  subnet_id                = null
  tags = {
    "Name" : "coupang_centralized_vpc_flow_logs",
    "role" : "kr_legacy_vpc_flow",
    "ticket" : "CMT-41903"
  }
  traffic_type                  = "ALL"
  transit_gateway_attachment_id = null
  transit_gateway_id            = null
  vpc_id                        = "vpc-0ae844d4dd7e1bfbe"

  destination_options = [{
    file_format                = "plain-text" // "plain-text"
    hive_compatible_partitions = true
    per_hour_partition         = true
  }]
}

