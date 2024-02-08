# output "vpc_set" {
#     value = module.legacy_vpc.vpc_set
# }

output "vpc_peering_single_account" {
    description = "Old & new ID List of VPC peering connection"
  value = [ for k, v in module.vpc_peering_single_account : v.old_new ]
}