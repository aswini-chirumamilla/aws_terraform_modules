module "imagebuilder_component" {
  source = "../../../../Modules/Compute/image builder/Image Builder Component"

  component_name        = var.component_name
  platform              = var.platform
  version_specification = var.version_specification
  component_description = var.component_description
  change_description    = var.change_description
  kms_key_id            = var.kms_key_id
  supported_os_versions = var.supported_os_versions
  uri                   = var.uri
  component_document    = var.component_document
  tags                  = var.tags
}