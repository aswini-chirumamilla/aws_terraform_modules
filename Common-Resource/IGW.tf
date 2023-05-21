module "internet_gateway" {
  source                    = "../../Modules/Networking & Content Delivery/Internet Gateway"
  vpc_id                    = module.vpc.vpc_id
  aws_internet_gateway_tags = merge(local.tags, var.aws_internet_gateway_tags)
}
