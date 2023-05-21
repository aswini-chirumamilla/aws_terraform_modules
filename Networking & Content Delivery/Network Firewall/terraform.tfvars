aws_region           = "us-east-2"
aws_profile          = "terraform"
firewall_description = "This is a test Network Firewall"
firewall_name        = "test-firewall"
firewall_vpc_id      = "vpc-08fb730721310d962"
firewall_policy_arn  = "arn:aws:network-firewall:us-east-2:239312700453:firewall-policy/test-firewall-policy"
firewall_subnets     = ["subnet-09d22a50392539dc1", "subnet-034e2f7e53d047c49", "subnet-002df92bd01041dfc"]
tags                 = { "environment" = "Test", "Project" = "Testing" }