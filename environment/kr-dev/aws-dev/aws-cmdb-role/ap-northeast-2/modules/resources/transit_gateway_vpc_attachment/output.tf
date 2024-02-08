output "transit_gateway_vpc_attachment" {
  description = "The instance of the transit_gateway_vpc_attachment"
  value       = try(aws_ec2_transit_gateway_vpc_attachment.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_ec2_transit_gateway_vpc_attachment.this.tags["PrevId"]}, New ID: ${aws_ec2_transit_gateway_vpc_attachment.this.id}"
}