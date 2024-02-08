provider "aws" {
  region = var.region
  dynamic "assume_role" {
    for_each = var.enable_assume_role ? [1] : []
    content {
      role_arn = var.role_arn
    }
  }
}


module "transit_gateway" {
  source = "../modules/resources/transit_gateway"

  for_each    = var.transit_gateways != null ? var.transit_gateways : {}
  name        = each.value.name
  description = each.value.description
  tags        = each.value.tags
}

module "managed_prefix_list" {
  source = "../modules/resources/managed_prefix_list"

  for_each = var.managed_prefix_lists != null ? var.managed_prefix_lists : {}

  name           = each.value.name
  address_family = each.value.address_family
  max_entries    = each.value.max_entries
  tags           = each.value.tags
  entry          = each.value.entry

}
// todo:
// just need set the rule for s3 bucket name for vpc-flow-logs
module "s3" {

  source   = "../modules/resources/s3"
  for_each = var.s3_buckets_for_vpc_flow_logs != null ? var.s3_buckets_for_vpc_flow_logs : {}

  bucket_name         = each.key
  force_destroy       = each.value.force_destroy
  object_lock_enabled = each.value.object_lock_enabled
  tags                = each.value.tags
}
