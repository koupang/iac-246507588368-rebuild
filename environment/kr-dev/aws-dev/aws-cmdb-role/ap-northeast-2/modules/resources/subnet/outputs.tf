output "subnet" {
  description = "The instance of the subnet"
  value       = try(aws_subnet.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_subnet.this.tags["PrevId"]}, New ID: ${aws_subnet.this.id}"
}