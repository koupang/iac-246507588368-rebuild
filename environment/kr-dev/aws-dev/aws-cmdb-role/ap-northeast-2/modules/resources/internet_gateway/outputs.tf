output "internet_gateway" {
  description = "internet_gateway"
  value       = try(aws_internet_gateway.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_internet_gateway.this.tags["PrevId"]}, New ID: ${aws_internet_gateway.this.id}"
}