provider "aws" {
  alias  = "requester"
  region = var.region
}

provider "aws" {
  alias  = "accepter"
  region = var.region
}

module "vpc_peering_single_account" {
  source = "../.."

  providers = {
    aws.requester = aws.requester
    aws.accepter  = aws.accepter
  }

  for_each          = var.vpc_peerings

  name = each.value.name

  requester = {
    vpc_id = each.value.requester.vpc_id
    region = var.region
    tags = each.value.requester.tags
  }

  accepter = {
    vpc_id = each.value.accepter.vpc_id
    region = var.region
    tags = each.value.accepter.tags
  }
}