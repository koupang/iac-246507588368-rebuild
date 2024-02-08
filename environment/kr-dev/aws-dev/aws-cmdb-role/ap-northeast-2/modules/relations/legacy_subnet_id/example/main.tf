module "subnet_id" {

  source = "../"

  subnets = {
    "front-subnet-private1-ap-northeast-2a" = {
      "subnet" = {
        "arn"                                            = "arn:aws:ec2:ap-northeast-2:793394343433:subnet/subnet-0135bbcb7e6ecfff9"
        "assign_ipv6_address_on_creation"                = false
        "availability_zone"                              = "ap-northeast-2a"
        "availability_zone_id"                           = "apne2-az1"
        "cidr_block"                                     = "172.31.128.0/20"
        "customer_owned_ipv4_pool"                       = ""
        "enable_dns64"                                   = false
        "enable_lni_at_device_index"                     = 0
        "enable_resource_name_dns_a_record_on_launch"    = false
        "enable_resource_name_dns_aaaa_record_on_launch" = false
        "id"                                             = "subnet-0135bbcb7e6ecfff9"
        "ipv6_cidr_block"                                = ""
        "ipv6_cidr_block_association_id"                 = ""
        "ipv6_native"                                    = false
        "map_customer_owned_ip_on_launch"                = false
        "map_public_ip_on_launch"                        = false
        "outpost_arn"                                    = ""
        "owner_id"                                       = "793394343433"
        "private_dns_hostname_type_on_launch"            = "ip-name"
        "tags" = tomap({
          "Environment" = "dev"
          "Name"        = "front-subnet-private1-ap-northeast-2a"
          "PrevId"      = "subnet-0555a6d490249722e"
          "cmdb-role"   = "cloud-ops"
        })
        "tags_all" = tomap({
          "Environment" = "dev"
          "Name"        = "front-subnet-private1-ap-northeast-2a"
          "PrevId"      = "subnet-0555a6d490249722e"
          "cmdb-role"   = "cloud-ops"
        })
        "timeouts" = null /* object */
        "vpc_id"   = "vpc-057e03ee4c7fb2d8a"
      }
    }
    "front-subnet-private2-ap-northeast-2b" = {
      "subnet" = {
        "arn"                                            = "arn:aws:ec2:ap-northeast-2:793394343433:subnet/subnet-0fe2c5eedf19572ff"
        "assign_ipv6_address_on_creation"                = false
        "availability_zone"                              = "ap-northeast-2b"
        "availability_zone_id"                           = "apne2-az2"
        "cidr_block"                                     = "172.31.144.0/20"
        "customer_owned_ipv4_pool"                       = ""
        "enable_dns64"                                   = false
        "enable_lni_at_device_index"                     = 0
        "enable_resource_name_dns_a_record_on_launch"    = false
        "enable_resource_name_dns_aaaa_record_on_launch" = false
        "id"                                             = "subnet-0fe2c5eedf19572ff"
        "ipv6_cidr_block"                                = ""
        "ipv6_cidr_block_association_id"                 = ""
        "ipv6_native"                                    = false
        "map_customer_owned_ip_on_launch"                = false
        "map_public_ip_on_launch"                        = false
        "outpost_arn"                                    = ""
        "owner_id"                                       = "793394343433"
        "private_dns_hostname_type_on_launch"            = "ip-name"
        "tags" = tomap({
          "Environment" = "dev"
          "Name"        = "front-subnet-private2-ap-northeast-2b"
          "PrevId"      = "subnet-07a190b470b2ae087"
          "cmdb-role"   = "cloud-ops"
        })
        "tags_all" = tomap({
          "Environment" = "dev"
          "Name"        = "front-subnet-private2-ap-northeast-2b"
          "PrevId"      = "subnet-07a190b470b2ae087"
          "cmdb-role"   = "cloud-ops"
        })
        "timeouts" = null /* object */
        "vpc_id"   = "vpc-057e03ee4c7fb2d8a"
      }
    }
    "front-subnet-public1-ap-northeast-2a" = {
      "subnet" = {
        "arn"                                            = "arn:aws:ec2:ap-northeast-2:793394343433:subnet/subnet-054aacf9c6b7d6751"
        "assign_ipv6_address_on_creation"                = false
        "availability_zone"                              = "ap-northeast-2a"
        "availability_zone_id"                           = "apne2-az1"
        "cidr_block"                                     = "172.31.0.0/20"
        "customer_owned_ipv4_pool"                       = ""
        "enable_dns64"                                   = false
        "enable_lni_at_device_index"                     = 0
        "enable_resource_name_dns_a_record_on_launch"    = false
        "enable_resource_name_dns_aaaa_record_on_launch" = false
        "id"                                             = "subnet-054aacf9c6b7d6751"
        "ipv6_cidr_block"                                = ""
        "ipv6_cidr_block_association_id"                 = ""
        "ipv6_native"                                    = false
        "map_customer_owned_ip_on_launch"                = false
        "map_public_ip_on_launch"                        = false
        "outpost_arn"                                    = ""
        "owner_id"                                       = "793394343433"
        "private_dns_hostname_type_on_launch"            = "ip-name"
        "tags" = tomap({
          "Environment" = "dev"
          "Name"        = "front-subnet-public1-ap-northeast-2a"
          "PrevId"      = "subnet-034a31feaa12a9c51"
          "cmdb-role"   = "cloud-ops"
        })
        "tags_all" = tomap({
          "Environment" = "dev"
          "Name"        = "front-subnet-public1-ap-northeast-2a"
          "PrevId"      = "subnet-034a31feaa12a9c51"
          "cmdb-role"   = "cloud-ops"
        })
        "timeouts" = null /* object */
        "vpc_id"   = "vpc-057e03ee4c7fb2d8a"
      }
    }
    "front-subnet-public2-ap-northeast-2b" = {
      "subnet" = {
        "arn"                                            = "arn:aws:ec2:ap-northeast-2:793394343433:subnet/subnet-0499c6290a632db49"
        "assign_ipv6_address_on_creation"                = false
        "availability_zone"                              = "ap-northeast-2b"
        "availability_zone_id"                           = "apne2-az2"
        "cidr_block"                                     = "172.31.16.0/20"
        "customer_owned_ipv4_pool"                       = ""
        "enable_dns64"                                   = false
        "enable_lni_at_device_index"                     = 0
        "enable_resource_name_dns_a_record_on_launch"    = false
        "enable_resource_name_dns_aaaa_record_on_launch" = false
        "id"                                             = "subnet-0499c6290a632db49"
        "ipv6_cidr_block"                                = ""
        "ipv6_cidr_block_association_id"                 = ""
        "ipv6_native"                                    = false
        "map_customer_owned_ip_on_launch"                = false
        "map_public_ip_on_launch"                        = false
        "outpost_arn"                                    = ""
        "owner_id"                                       = "793394343433"
        "private_dns_hostname_type_on_launch"            = "ip-name"
        "tags" = tomap({
          "Environment" = "dev"
          "Name"        = "front-subnet-public2-ap-northeast-2b"
          "PrevId"      = "subnet-01b7934bedbd248e8"
          "cmdb-role"   = "cloud-ops"
        })
        "tags_all" = tomap({
          "Environment" = "dev"
          "Name"        = "front-subnet-public2-ap-northeast-2b"
          "PrevId"      = "subnet-01b7934bedbd248e8"
          "cmdb-role"   = "cloud-ops"
        })
        "timeouts" = null /* object */
        "vpc_id"   = "vpc-057e03ee4c7fb2d8a"
      }
    }
  }

}
output "new_subnet_map" {
  value = module.subnet_id.new_subnet_map
}
