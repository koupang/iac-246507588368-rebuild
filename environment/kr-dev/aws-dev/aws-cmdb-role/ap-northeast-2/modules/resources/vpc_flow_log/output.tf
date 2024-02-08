
output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${try(aws_flow_log.vpc-flow-logs[0].tags["PrevId"], "")}, New ID: ${try(aws_flow_log.vpc-flow-logs[0].id, "")}"
}