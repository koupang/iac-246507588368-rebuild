module "vpc" {
  source = "../.."

  name       = "test2"
  cidr_block = "10.0.0.0/16"
  tags = {
    "Environment" : "default",
    "CreatedDate" : "2023-12-07",
    "CreatedBy" : "xhoto"
  }
}
