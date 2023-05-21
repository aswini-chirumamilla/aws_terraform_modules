#----------------------Variables for Provider-----------------------------------------------------------#

aws_region  = "us-east-1"
aws_profile = "RishiHazra"

#----------------------Variables for Distribution Configuration resource-----------------------------------------------------------#

distribution_configuration_name        = "terraform-distribution-configuration-1"
distribution_configuration_description = "Distribution configuration deployed by Terraform"
distribution = [{
  distribution_configuration_region = "us-east-2"
  license_configuration_arns        = ["arn:aws:license-manager:us-east-2:051171442365:license-configuration:lic-36c32ab8012544ce48eb0f7bbf98b955"] #required
  ami_distribution_configuration = [{
    ami_tags = {
      config_block = "ami_distribution_configuration"
      environment  = "Development"
    }
    distributed_ami_description = "Testing Distributed AMI"
    kms_key_id                  = "4dc3e4c6-b098-425c-813b-67796f7b8e11"
    distributed_ami_name        = "distri-config"
    target_account_ids          = ["051171442365"]
    launch_permission = [{
      organization_arns        = ["arn:aws:organizations::908416975963:organization/o-12ls3dh2ni"]
      account_ids              = ["051171442365"]
    }]
  }]
  fast_launch_configuration = []                    #Fast launch configuration AMI is not available in AWS Console yet , hence empty list has been given for input .
  launch_template_configuration = [{
    launch_template_id = "lt-07ce01f2907930647"
    account_id         = "051171442365"
    default            = true
  }]
}]

#-----------------------------Tags Variables------------------------------------------------------------

tags = {
  environment = "Development"
  module_name = "Distribution Configuration"
}