output "managed_prefix_list" {
  description = "The instance of the subnet"
  value       = try(aws_ec2_managed_prefix_list.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_ec2_managed_prefix_list.this.tags["PrevId"]}, New ID: ${aws_ec2_managed_prefix_list.this.id}"
}