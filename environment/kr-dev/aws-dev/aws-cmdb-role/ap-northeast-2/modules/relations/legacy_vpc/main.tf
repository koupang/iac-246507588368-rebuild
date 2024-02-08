# TODO: xhoto.choi 20240122 우선 data 만 추가 resource 로 추가하는거 작업 필요. 
# var.vpcs 로 받아서 count 로 binding 동적으로 처리하도록 수정 예정

// get a list of vpc ids created with prev-vpc-id tag in rebuild account
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpcs
data "aws_vpcs" "this" {
}

// create set of detals of vpc though the list of vpc ids in rebuild account
data "aws_vpc" "this" {
  for_each = toset(data.aws_vpcs.this.ids)
  id       = each.value
}

// create a map of prev-vpc-id and new-vpc-id
// { "prev-vpc-id" : "new-vpc-id"}
locals {
  vpc_set = {
    for vpc in data.aws_vpc.this : vpc.tags["PrevId"] => vpc.id
    if contains(keys(vpc.tags), "PrevId")
  
  }
}
