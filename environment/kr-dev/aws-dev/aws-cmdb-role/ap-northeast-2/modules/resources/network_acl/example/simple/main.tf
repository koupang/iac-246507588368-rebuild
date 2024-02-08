

module "network_acl" {
  source = "../.."

  vpc_id = "vpc-07316dc140ec8439a"

  name       = "test-network-acl"
  subnet_ids = []
  tags = {
    "PrevId" : "acl-091aa8452643645ac"
  }


  egress = {
    "101" : {
      "action" : "allow",
      "cidr_block" : "10.0.0.0/8",
      "from_port" : 1024,
      "icmp_code" : 0,
      "icmp_type" : 0,
      "ipv6_cidr_block" : "",
      "protocol" : "6",
      "to_port" : 65535
    },

    "55" : {
      "action" : "allow",
      "cidr_block" : "10.211.176.0/20",
      "from_port" : 443,
      "icmp_code" : 0,
      "icmp_type" : 0,
      "ipv6_cidr_block" : "",
      "protocol" : "6",
      "to_port" : 443
    },
    "56" : {
      "action" : "allow",
      "cidr_block" : "10.211.192.0/20",
      "from_port" : 443,
      "icmp_code" : 0,
      "icmp_type" : 0,
      "ipv6_cidr_block" : "",
      "protocol" : "6",
      "to_port" : 443
    }
  }

  ingress = {
    "305" : {
      "action" : "allow",
      "cidr_block" : "10.0.0.0/8",
      "from_port" : 27017,
      "icmp_code" : 0,
      "icmp_type" : 0,
      "ipv6_cidr_block" : "",
      "protocol" : "6",
      "to_port" : 27017
    },
    "101" : {
      "action" : "allow",
      "cidr_block" : "10.0.0.0/8",
      "from_port" : 3306,
      "icmp_code" : 0,
      "icmp_type" : 0,
      "ipv6_cidr_block" : "",
      "protocol" : "6",
      "to_port" : 6379
    }
  }



}
