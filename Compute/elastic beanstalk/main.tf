module "elastic_beanstalk"{

  source                               = "../../../Modules/Compute/elastic beanstalk"
  app_name                             = var.app_name
  app_description                      = var.app_description
  app_lifecycle_max_count              = var.app_lifecycle_max_count
  app_lifecycle_max_age_in_days        = var.app_lifecycle_max_age_in_days
  app_lifecycle_delete_source          = var.app_lifecycle_delete_source
  elastic_beanstalk_app_tags           = var.elastic_beanstalk_app_tags
  application_version_name             = var.application_version_name
  application_version_description      = var.application_version_description
  app_version_source                   = var.app_version_source
  force_delete_ebs_application_version = var.force_delete_ebs_application_version
  bucket_id                            = var.bucket_id
  role_policy                          = var.role_policy
  iam_role_tags                        = var.iam_role_tags
  tags                                 = var.tags
  tier                                 = var.tier
  elastic_beanstalk_cname              = var.elastic_beanstalk_cname
  solution_stack_name                  = var.solution_stack_name
  beanstalkappenv                      = var.beanstalkappenv
  environment_description              = var.environment_description
  settings_elastic_beanstalk_env       = var.settings_elastic_beanstalk_env
}