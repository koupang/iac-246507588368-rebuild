output "s3_bucket_for_vpc_flow_logs" {
  value = try(aws_s3_bucket.this, null)
}

output "old_new" {
  description = "IDs of Resources"
  value = "Old ID: ${aws_s3_bucket.this.tags["PrevId"]}, New ID: ${aws_s3_bucket.this.id}"
}