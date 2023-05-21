aws_region                     = "us-west-2"
aws_profile                    = "terraform-practice"
create                         = true
auto_scaling_configuration_arn = ""
service_source_type            = "image"
image_repository_type          = "ECR"
image_identifier               = "448269213100.dkr.ecr.us-west-2.amazonaws.com/app-runner:latest"
image_configuration            = { port = 80 }
image_access_role_arn          = "arn:aws:iam::448269213100:role/AppRunnerRoleForECR"
health_check_configuration     = null
observability_configuration    = null
instance_configuration         = null
vpc_connector_arn              = null
kms_key_arn                    = "arn:aws:kms:us-west-2:448269213100:key/31271a6c-99d7-496b-bfe0-4a4ffbdf710e"
auto_deployments_enabled       = false
tags = {
  name : "tf"
}