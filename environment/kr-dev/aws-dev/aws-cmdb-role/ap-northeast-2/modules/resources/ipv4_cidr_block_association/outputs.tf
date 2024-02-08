output "ipv4_cidr_block_association" {
  description = "The ID of the IPv4 CIDR block association"
  value       = try(aws_vpc_ipv4_cidr_block_association.this.id, null)
}