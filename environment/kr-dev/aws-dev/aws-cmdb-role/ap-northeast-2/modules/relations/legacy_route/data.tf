data "aws_ec2_managed_prefix_lists" "pl_lists" {
  
}

data "aws_ec2_managed_prefix_list" "this" {
  for_each = data.aws_ec2_managed_prefix_lists.pl_lists.ids != [] ? toset(data.aws_ec2_managed_prefix_lists.pl_lists.ids) : toset([])

  filter {
    name   = "prefix-list-id"
    values = [each.value]
  }
}

