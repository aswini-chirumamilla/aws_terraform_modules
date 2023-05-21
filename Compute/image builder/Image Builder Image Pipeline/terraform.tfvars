#Image Builder Pipeline values for Windows OS as base platform 
aws_region                       = "us-east-1"
aws_profile                      = "RishiHazra"
image_recipe_arn                 = "arn:aws:imagebuilder:us-east-1:051171442365:image-recipe/windows-os-image-recipe-new/1.0.0"
infrastructure_configuration_arn = "arn:aws:imagebuilder:us-east-1:051171442365:infrastructure-configuration/new-infra-configuration-windows-base-latest"
imagebuilder_image_pipeline_name = "image_pipeline_windows_latest"
container_recipe_arn             = null
distribution_configuration_arn   = null
description                      = "Image pipeline"
enhanced_image_metadata_enabled  = true
pipeline_status                  = "ENABLED"
tags                             = { name = "Imagebuilder_Image_pipeline"
                                     environment = "dev" }
image_tests_enabled              = true
timeout_minutes                  = 720
schedule                         = "cron(30 10 1 * *)"

/*

Image Builder Pipeline values for Linux OS as base platform 

aws_region                       = "us-east-1"
aws_profile                      = "RishiHazra"
image_recipe_arn                 = "arn:aws:imagebuilder:us-east-1:051171442365:image-recipe/img-recipe-linux/1.0.0"
infrastructure_configuration_arn = "arn:aws:imagebuilder:us-east-1:051171442365:infrastructure-configuration/infra-configuration-linux-base-os"
imagebuilder_image_pipeline_name = "image_pipeline_linux"
container_recipe_arn             = null
distribution_configuration_arn   = null
description                      = "Image pipeline"
enhanced_image_metadata_enabled  = true
pipeline_status                  = "ENABLED"
tags                             = { name = "Imagebuilder_Image_pipeline"
                                     environment = "dev" }
image_tests_enabled              = true
timeout_minutes                  = 720
schedule                         = "cron(30 10 1 * *)"

*/