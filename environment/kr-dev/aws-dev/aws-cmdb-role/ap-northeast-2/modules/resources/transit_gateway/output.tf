output "transit_gateway" {
  description = "The instance of the subnet"
  value       = try(aws_ec2_transit_gateway.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_ec2_transit_gateway.this.tags["PrevId"]}, New ID: ${aws_ec2_transit_gateway.this.id}"
}