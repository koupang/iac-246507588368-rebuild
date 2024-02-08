module "transit_gateway" {
  source = "../.."

  name        = "test2"
  description = ""
  tags = {
    "Environment" : "default",
    "CreatedDate" : "2023-12-07",
    "CreatedBy" : "xhoto"
  }
}
