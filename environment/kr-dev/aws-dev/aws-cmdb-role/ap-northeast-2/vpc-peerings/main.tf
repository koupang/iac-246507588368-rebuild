provider "aws" {
  # alias  = "requester"
  region = var.region
  dynamic "assume_role" {
    for_each = var.enable_assume_role ? [1] : []
    content {
      role_arn = var.role_arn
    }
  }
}

# provider "aws" {
#   alias  = "accepter"
#   region = var.region
#   dynamic "assume_role" {
#     for_each = var.enable_assume_role ? [1] : []
#     content {
#       role_arn = var.role_arn
#     }
#   }
# }

module "legacy_vpc" {
  source = "../modules/relations/legacy_vpc"
}

module "vpc_peering_single_account" {
  source = "../modules/resources/vpc_peering"

  # providers = {
  #   aws.requester = aws.requester
  #   aws.accepter  = aws.accepter
  # }

  // for prev vpc-peering connection list
  for_each = var.vpc_peerings

  name = each.value.name

  // pass legacy vpc peering's requester vpc id to get newly created vpc is for requester or accepter
  requester = {
    vpc_id = module.legacy_vpc.vpc_set[each.value.requester.vpc_id]
    region = var.region
    tags   = each.value.requester.tags
  }


  accepter = {
    vpc_id = module.legacy_vpc.vpc_set[each.value.accepter.vpc_id]
    region = var.region
    tags   = each.value.accepter.tags
  }
}