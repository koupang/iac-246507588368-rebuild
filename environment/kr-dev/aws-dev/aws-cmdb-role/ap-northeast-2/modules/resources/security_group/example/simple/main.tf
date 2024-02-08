module "security_group" {
  source            = "../.."
  name = "default"
  description         = "default VPC security group"
  vpc_id = "vpc-078bf943878946b50"

  egress = []
  ingress = []
  
  tags = {
    "ImportedDate" : "2023-11-08",
    "Importor" : "xhoto",
    "Name" : "simple-vpc-ap-northeast-2a",
    "cmdb-role" : "cloud-ops",
    "vpc-name" : "simple-vpc"
  }
}
