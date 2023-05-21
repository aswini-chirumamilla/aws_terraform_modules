aws_region         = "us-east-1"
aws_profile        = "RishiHazra"
recipe_name        = "windows_os_image_recipe_new"
parent_image       = "ami-0c4af4610ab22c4f4"
recipe_version     = "1.0.0"
recipe_description = "recipe_test"
tags = { name = "ImgRecipe"
environment = "dev" }
user_data_base64      = null
working_directory     = null
device_name           = "/dev/xvdb"
no_device             = true
virtual_name          = "ephemeral0"
delete_on_termination = true
encrypted             = true
iops                  = null
kms_key_id            = "493b26cd-4e95-4ab2-ba88-c447a8a62c00"
snapshot_id           = null
throughput            = null
volume_size           = 100
volume_type           = "gp2"
component = [
  {
  component_arn = "arn:aws:imagebuilder:us-east-1:051171442365:component/windows-base-component/1.0.0"
  parameter = [{ para_name = "Source"
  para_value = "https://awscli.amazonaws.com/AWSCLIV2.msi" }]
}
]