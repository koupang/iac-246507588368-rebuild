module "managed_prefix_list" {

  source = "../.."

  name           = "test_managed_prefix_list"
  address_family = "IPv4"
  max_entries    = 1


  tags = {
    "Environment" : "default",
    "CreatedDate" : "2023-12-07",
    "CreatedBy" : "xhoto"
  }

  entry = {
    1 : {
      cidr        = "10.10.10.0/24",
      description = "dev"
    },
    2 : {
      cidr        = "10.10.20.0/24"
      description = "stg"
    }
  }

}
