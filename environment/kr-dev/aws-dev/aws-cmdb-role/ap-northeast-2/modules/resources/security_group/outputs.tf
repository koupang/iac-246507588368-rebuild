output "security_group" {
  description = "The security group"
  value       = try(aws_security_group.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_security_group.this.tags["PrevId"]}, New ID: ${aws_security_group.this.id}"
}