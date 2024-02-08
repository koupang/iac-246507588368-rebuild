output "vpc_endpoint" {
  description = "vpc_endpoint"
  value       = try(aws_vpc_endpoint.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_vpc_endpoint.this.tags["PrevId"]}, New ID: ${aws_vpc_endpoint.this.id}"
}