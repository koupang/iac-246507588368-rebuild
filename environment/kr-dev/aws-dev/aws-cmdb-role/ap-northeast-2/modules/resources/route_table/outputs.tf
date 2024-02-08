output "route_table" {
  description = "Route Table"
  value       = try(aws_route_table.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_route_table.this.tags["PrevId"]}, New ID: ${aws_route_table.this.id}"
}