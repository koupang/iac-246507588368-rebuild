output "nat_gateway" {
  description = "NAT Gateway"
  value       = try(aws_nat_gateway.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_nat_gateway.this.tags["PrevId"]}, New ID: ${aws_nat_gateway.this.id}"
}