output "eip" {
  description = "EIP"
  value       = try(aws_eip.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_eip.this.tags["PrevId"]}, New ID: ${aws_eip.this.id}"
}