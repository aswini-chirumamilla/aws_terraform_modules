#Infrastructure configuration for Windows OS base platform

aws_region                    = "us-east-1"
aws_profile                   = "RishiHazra"
infra_config_name             = "new_infra_configuration_windows_base_latest"
instance_profile_name         = "imgbuilder-tf-role"
infra_config_description      = "windows-base-infra-config"
instance_types                = ["t3.micro"]
key_pair                      = "img-bld-1"
security_group_ids            = ["sg-0a98f0475ad2cf064"]
sns_topic_arn                 = null
subnet_id                     = "subnet-0a18d7f46636b65c6"
terminate_instance_on_failure = false
enable_logging                = false
logging                       = null
imagebuilder_infra_config_tags = { name = "ImgConfig"
environment = "dev" }

/*

Infrastructure configuration for Linux OS base platform

aws_region                    = "us-east-1"
aws_profile                   = "RishiHazra"
infra_config_name             = "infra_configuration_linux_base_os"
instance_profile_name         = "imgbuilder-tf-role"
infra_config_description      = "linux_os-base-infra-config"
instance_types                = ["t3.micro"]
key_pair                      = "img-bld-1"
security_group_ids            = ["sg-0a98f0475ad2cf064"]
sns_topic_arn                 = null
subnet_id                     = "subnet-0a18d7f46636b65c6"
terminate_instance_on_failure = false
enable_logging                = false
logging                       = null
imagebuilder_infra_config_tags = { name = "ImgConfig"
environment = "dev" }

*/