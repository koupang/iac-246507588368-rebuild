output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_vpc_peering_connection.peer.tags["PrevId"]}, New ID: ${aws_vpc_peering_connection.peer.id}"
}