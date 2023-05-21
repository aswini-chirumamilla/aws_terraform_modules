module "imagebuilder_distribution_configuration" {
  source = "../../../../Modules/Compute/image builder/Image Builder Distribution Configuration"

  distribution_configuration_name        = var.distribution_configuration_name
  distribution_configuration_description = var.distribution_configuration_description
  distribution                           = var.distribution
  tags                                   = var.tags
}