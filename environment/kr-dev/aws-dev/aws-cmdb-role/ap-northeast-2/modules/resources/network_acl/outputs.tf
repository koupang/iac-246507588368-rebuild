output "network_acl" {
  description = "network ACLs"
  value       = try(aws_network_acl.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_network_acl.this.tags["PrevId"]}, New ID: ${aws_network_acl.this.id}"
}