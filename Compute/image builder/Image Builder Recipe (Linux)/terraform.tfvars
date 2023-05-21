aws_region         = "us-east-1"
aws_profile        = "RishiHazra"
recipe_name        = "img_recipe_linux"
parent_image       = "ami-0fa3a140e61622d50"
recipe_version     = "1.0.0"
recipe_description = "recipe_test"
tags = { name = "ImgRecipe"
environment = "dev" }
user_data_base64      = null
working_directory     = null
uninstall_after_build = true
device_name           = "/dev/xvdb"
no_device             = true
virtual_name          = "RecVName"
delete_on_termination = true
encrypted             = null
iops                  = null
kms_key_id            = null
snapshot_id           = null
throughput            = null
volume_size           = 100
volume_type           = "gp2"
component             = [
                          {
                            component_arn = "arn:aws:imagebuilder:us-east-1:051171442365:component/linux-component/1.0.0/1"
                            parameter = []
                          }
                        ]