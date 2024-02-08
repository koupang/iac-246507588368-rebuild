module "subnet" {
  source            = "../.."
  vpc_id            = "vpc-064426f5276b07352"
  name              = "test2_subnet"
  cidr_block        = "10.0.0.0/16"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Environment" : "default",
    "CreatedDate" : "2023-12-07",
    "CreatedBy" : "xhoto"
  }
}
