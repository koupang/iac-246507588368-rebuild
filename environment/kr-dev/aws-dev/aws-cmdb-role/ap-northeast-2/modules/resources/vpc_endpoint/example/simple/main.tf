module "vpc_endpoint" {
  source              = "../.."
  service_name        = "com.amazonaws.ap-northeast-2.s3"
  vpc_id              = "vpc-078bf943878946b50"
  route_table_ids     = ["rtb-06c8fe0bb25452968"]
  vpc_endpoint_type   = "Gateway"
  policy              = "{\"Statement\":[{\"Action\":\"*\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"*\"}],\"Version\":\"2008-10-17\"}"

  tags = {
    Name = "simple-gateway"
  }
}

module "vpc_endpoint2" {
  dns_record_ip_type                             = "ipv4"
  private_dns_only_for_inbound_resolver_endpoint = "false"
  source                                         = "../.."
  service_name                                   = "com.amazonaws.ap-northeast-2.execute-api"
  vpc_id                                         = "vpc-078bf943878946b50"
  subnet_ids                                     = ["subnet-055539f6beb06b505", "subnet-06c6842eaee6f7237"]
  security_group_ids                             = ["sg-0117deaa2fa5cd09b"]
  vpc_endpoint_type                              = "Interface"
  private_dns_enabled                            = "true"
  policy                                         = "{\"Statement\":[{\"Action\":\"*\",\"Effect\":\"Allow\",\"Principal\":\"*\",\"Resource\":\"*\"}]}"

  tags = {
    Name = "simple-interface"
  }
}