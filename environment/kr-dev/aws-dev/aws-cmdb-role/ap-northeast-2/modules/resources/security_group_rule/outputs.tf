output "security_group_rule_ssg" {
  description = "The security group_rule"
  value       = try(aws_security_group_rule.ssg, null)
}

output "security_group_rule_self" {
  description = "The security group_rule"
  value       = try(aws_security_group_rule.self, null)
}

output "security_group_rule_rest" {
  description = "The security group_rule"
  value       = try(aws_security_group_rule.rest, null)
}
# output "security_group_rule_ipv6" {
#   description = "The security group_rule"
#   value       = try(aws_security_group_rule.ipv6, null)
# }

