# output "s3_bucket_for_vpc_flow_logs" {
#   value = module.s3.s3_bucket_for_vpc_flow_logs.arn
# }

output "transit_gateway" {
  value = [ for k, v in module.transit_gateway : v.old_new ]
}

output "managed_prefix_list" {
  value = [ for k, v in module.managed_prefix_list : v.old_new ]
}

output "s3" {
  value = [ for k, v in module.s3 : v.old_new ]
}