module "nat_gateway" {
  source            = "../.."
  subnet_id         = "subnet-0eb18cbce2bf97480"
  connectivity_type = "public"

  tags = {
    "ImportedDate" : "2023-11-08",
    "Importor" : "xhoto",
    "Name" : "simple-vpc-ap-northeast-2a",
    "cmdb-role" : "cloud-ops",
    "vpc-name" : "simple-vpc"
  }
}
