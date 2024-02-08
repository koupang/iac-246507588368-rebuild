output "vpc_id" {
  description = "The ID of the VPC"
  value       = try(aws_vpc.this.id, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_vpc.this.tags["PrevId"]}, New ID: ${aws_vpc.this.id}"
}