module "sg_connection" {
  source = "../"

  security_groups = {
    "test-security-group1" = {
      "security_group" = {
        "description" : "validate test",
        "id" : "sg-11111111111-new",
        "name" : "test-security-group",
        "tags" : {
          "PrevId" : "sg-11111111111-old"
        },
        "vpc_id" : "vpc-078bf943878946b50"
      }
    },
    "test-security-group2" = {
      "security_group" = {
        "description" : "validate test",
        "id" : "sg-2222222222222-new",
        "name" : "test-security-group2",
        "tags" : {
          "PrevId" : "sg-2222222222222-old"
        },
        "vpc_id" : "vpc-078bf943878946b50"
      }
    },
    "test-security-group3" = {
      "security_group" = {
        "description" : "validate test",
        "id" : "sg-33333333333-new",
        "name" : "test-security-group",
        "tags" : {
          "PrevId" : "sg-33333333333-old"
        },
        "vpc_id" : "vpc-078bf943878946b50"
      }
    }
  }

  security_groups_with_legacy_relations = { 
    "sg-abcd1234" : "sg-11111111111-old",
    "sg-efgh5678" : "sg-2222222222222-old",
    "sg-ijkl9012" : "sg-4444444444444-old" 
  }
  source_security_group_ids_with_legacy_relations = {
    "ingress-from-0--1" : ["sg-11111111111-old", "sg-2222222222222-old"],
    "ingress-from-0--2" : ["sg-2222222222222-old", "sg-33333333333-old"],
    "ingress-from-0--3" : ["sg-4444444444444-old", "sg-33333333333-old"]
  }

}


output "a_security_groups_with_legacy_relations" {
  value = module.sg_connection.security_groups_with_legacy_relations
}

output "b_source_security_group_ids_with_legacy_relations" {
  value = module.sg_connection.source_security_group_ids_with_legacy_relations
}

output "c_sg_mapping" {
  value = module.sg_connection.sg_mapping
}

output "d_new_security_groups" {
  value = module.sg_connection.new_security_groups
}

output "e_new_source_security_group_ids" {
  value = module.sg_connection.new_source_security_group_ids
}
