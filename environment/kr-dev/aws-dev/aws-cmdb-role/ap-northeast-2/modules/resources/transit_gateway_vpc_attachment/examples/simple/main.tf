module "transit_gateway_vpc_attachment" {
  source = "../.."

  name                 = "simple-tga"
  transit_gateway_name = "cloud-ops-tg"
  subnet_ids           = ["subnet-055539f6beb06b505", "subnet-078d24d78918e181a", "subnet-06c6842eaee6f7237"]
  vpc_id               = "vpc-078bf943878946b50"
  tags = {
    "Environment" : "default",
    "CreatedDate" : "2023-12-07",
    "CreatedBy" : "xhoto"
  }
}