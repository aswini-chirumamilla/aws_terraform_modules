module "iam_group_mutiple" {
  source  = "../../../../Modules/Security-Identity-Compliance/IAM/Multiple users assigned to multiple groups with multiple policies"
  region  = "ap-south-1"
  profile = "Profile-1"
  users   = ["user0", "user1", "user2", "user3"]
  groups  = ["group0", "group1"]
}