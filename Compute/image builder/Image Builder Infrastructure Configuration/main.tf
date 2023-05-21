module "imagebuilder_infrastructure_configuration" {
  source = "../../../../Modules/Compute/image builder/Image Builder Infrastructure Configuration"

  infra_config_name              = var.infra_config_name
  instance_profile_name          = var.instance_profile_name
  infra_config_description       = var.infra_config_description
  instance_types                 = var.instance_types
  key_pair                       = var.key_pair
  security_group_ids             = var.security_group_ids
  sns_topic_arn                  = var.sns_topic_arn
  subnet_id                      = var.subnet_id
  terminate_instance_on_failure  = var.terminate_instance_on_failure
  enable_logging                 = var.enable_logging
  logging                        = var.logging
  imagebuilder_infra_config_tags = var.imagebuilder_infra_config_tags
}