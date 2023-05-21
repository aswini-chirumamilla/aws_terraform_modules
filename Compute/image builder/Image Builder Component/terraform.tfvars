#For Windows Platform , write the following values

aws_region            = "us-east-1"
aws_profile           = "RishiHazra"
component_name        = "Windows_base_component"
platform              = "Windows"
version_specification = "1.0.0"
component_description = "Windows supported OS version component"
change_description    = null
kms_key_id            = null
supported_os_versions = ["Microsoft Windows Server 2019"]
uri                   = null
component_document    = "./terraformdata.yml"
tags                  = { name = "Imagebuilder_component"
                          environment = "dev" }

/*For Linux platform , write the following values in terraform.tfvars

aws_region                    = "us-east-1"
aws_profile                   = "RishiHazra"
component_name                = "Linux Component"
platform                      = "Linux" 
version_specification         = "1.0.0"
component_description         = "Amazon Linux supported OS version component"
change_description            = null
kms_key_id                    = null
supported_os_versions         = ["Amazon Linux 2"]
uri                           = null
component_document            = "./terraformdata.yml"
tags                          = { name = "Imagebuilder_component"
                                  environment = "dev" }
*/