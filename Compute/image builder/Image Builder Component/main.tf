resource "aws_imagebuilder_component" "component" {
  name                  = var.component_name
  platform              = var.platform
  version               = var.version_specification
  description           = var.component_description
  change_description    = var.change_description
  kms_key_id            = var.kms_key_id
  supported_os_versions = var.supported_os_versions
  uri                   = var.uri
  data                  = data.local_file.input.content
  tags                  = var.tags
}


