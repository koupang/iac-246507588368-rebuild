output "network_interface" {
  description = "Network Interface"
  value       = try(aws_network_interface.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_network_interface.this.tags["PrevId"]}, New ID: ${aws_network_interface.this.id}"
}