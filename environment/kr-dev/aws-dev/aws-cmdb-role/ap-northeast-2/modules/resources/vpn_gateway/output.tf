output "vpn_gateway" {
  description = "the VPN gateway"
  value       = try(aws_vpn_gateway.this, null)
}

output "amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the specific VPN gateway."
  value       = try(aws_vpn_gateway.this.amazon_side_asn, null)
}

output "availability_zone" {
  description = "The Availability Zone for the specific VPN gateway."
  value       = try(aws_vpn_gateway.this.availability_zone, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_vpn_gateway.this.tags["PrevId"]}, New ID: ${aws_vpn_gateway.this.id}"
}