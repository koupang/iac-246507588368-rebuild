data "aws_ec2_managed_prefix_lists" "pl_lists" {
  
}

data "aws_ec2_managed_prefix_list" "pl_list" {
  for_each = data.aws_ec2_managed_prefix_lists.pl_lists.ids != [] ? toset(data.aws_ec2_managed_prefix_lists.pl_lists.ids) : toset([])

  filter {
    name   = "prefix-list-id"
    values = [each.value]
  }
}

data "aws_route_tables" "rt_lists" {
  
}

data "aws_route_table" "rt_list" {
  for_each = data.aws_route_tables.rt_lists.ids != [] ? toset(data.aws_route_tables.rt_lists.ids) : toset([])

  filter {
    name   = "route-table-id"
    values = [each.value]
  }
}

data "aws_vpc_peering_connections" "pc_lists" {

}

data "aws_vpc_peering_connection" "pc_list" {
  for_each = data.aws_vpc_peering_connections.pc_lists.ids != [] ? toset(data.aws_vpc_peering_connections.pc_lists.ids) : toset([])

  filter {
    name   = "vpc-peering-connection-id"
    values = [each.value]
  }
}