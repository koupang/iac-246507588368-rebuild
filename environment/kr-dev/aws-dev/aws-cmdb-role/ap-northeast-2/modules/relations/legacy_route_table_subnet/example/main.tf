module "subnet_connection" {
  source = "../"

  subnets = {
    "test-subnet1" = {
      "subnet" = {
        "description" : "validate test",
        "id" : "subnet-11111111111-new",
        "name" : "test-security-group",
        "tags" : {
          "PrevId" : "subnet-11111111111-old"
        },
        "vpc_id" : "vpc-078bf943878946b50"
      }
    },
    "test-subnet2" = {
      "subnet" = {
        "description" : "validate test2",
        "id" : "subnet-222222222-new",
        "name" : "test-security-group",
        "tags" : {
          "PrevId" : "subnet-222222222-old"
        },
        "vpc_id" : "vpc-078bf943878946b50"
      }
    },
    "test-subnet3" = {
      "subnet" = {
        "description" : "validate test3",
        "id" : "subnet-333333333-new",
        "name" : "test-security-group",
        "tags" : {
          "PrevId" : "subnet-333333333-old"
        },
        "vpc_id" : "vpc-078bf943878946b50"
      }
    }
  }

  rt_subnets_with_legacy_relations = { 
    "subnet-abcd1234" : "subnet-11111111111-old" ,
    "subnet-efgh5678" : "subnet-222222222-old"
    }
}


output "a_rt_subnets_with_legacy_relations" {
  value = module.subnet_connection.rt_subnets_with_legacy_relations
}

output "b_subnet_mapping" {
  value = module.subnet_connection.subnet_mapping
}

output "c_new_subnets" {
  value = module.subnet_connection.new_subnets
}
