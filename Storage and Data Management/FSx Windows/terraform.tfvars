aws_region           = "us-west-2"
aws_profile          = "terraform"
directory_id         = "d-9267579dfb"
subnet_id            = ["subnet-022c451db9cb30d6f"]
capacity             = 200
aliases              = []
storage_type         = "SSD"
deployment_type      = "SINGLE_AZ_1"
copy_tags_to_backups = false
preferred_subnet_id  = "subnet-022c451db9cb30d6f"
skip_final_backup    = false
throughput_capacity  = 1024
#backup_days          = 7
#kms_key_id          = "8d52a0a4-efa0-4411-9bfa-e1b4b2fcff19"
#backup_id           = "backup-085fade234e273b9c"
#audit_log_destination = "arn:aws:logs:us-west-2:239312700453:log-group:/aws/fsx/demo:*"
#file_access_audit_log_level = "FAILURE_ONLY"
#file_share_access_audit_log_level = "FAILURE_ONLY"
#security_group_ids  = ["sg-03455c68b5acd0446"]
tags = {
  "Environment" = "Testing"
}
#------variable values for self-managed directory. Assigned the required parameters in this configuration block to null when using aws managed directory and vice-versa.-------

dns_ips     = ["10.0.0.103", "10.0.1.250"]
domain_name = "corp.example.com"
username    = "admin"
secretname  = "FSxWindows"

