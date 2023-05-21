module "apprunnner" {
  source = "../../../Modules/Compute/App-Runner"

  create                         = var.create
  auto_scaling_configuration_arn = var.auto_scaling_configuration_arn
  tags                           = merge(local.tags, var.tags)
  service_source_type            = var.service_source_type
  image_repository_type          = var.image_repository_type
  image_identifier               = var.image_identifier
  image_configuration            = var.image_configuration
  image_access_role_arn          = var.image_access_role_arn
  code_repository_url            = var.code_repository_url
  code_version_type              = var.code_version_type
  code_version_value             = var.code_version_value
  code_configuration_source      = var.code_configuration_source
  code_configuration_values      = var.code_configuration_values
  service_name                   = local.name_tag_val
  health_check_configuration     = var.health_check_configuration
  instance_configuration         = var.instance_configuration
  vpc_connector_arn              = aws_apprunner_vpc_connector.connector.arn
  kms_key_arn                    = var.kms_key_arn
  auto_deployments_enabled       = var.auto_deployments_enabled
  observability_configuration    = var.observability_configuration
  #code_connection_arn            = aws_apprunner_connection.main.arn Note:used with github code source
}

locals {
  name_tag_val = join("-", [data.aws_caller_identity.current.account_id, data.aws_availability_zones.az.id])
  tags         = { Name = local.name_tag_val }
  name         = "source_config_repo"

}

resource "aws_apprunner_vpc_connector" "connector" {
  vpc_connector_name = "tf-connector"
  subnets            = ["subnet-11249e5b", "subnet-fefc97a3"]
  security_groups    = ["sg-39778232"]
}