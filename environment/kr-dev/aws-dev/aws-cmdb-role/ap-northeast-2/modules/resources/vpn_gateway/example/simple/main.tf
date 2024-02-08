module "vpn_gateway" {
  source = "../.."
  name   = "test_vpn_gateway"
  vpc_id = "vpc-078bf943878946b50"
  tags = {
    "Environment" : "default",
    "CreatedDate" : "2023-12-07",
    "CreatedBy" : "xhoto"
  }
}
