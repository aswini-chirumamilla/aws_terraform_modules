module "internet_gateway" {
  source                    = "../../../Modules/Networking & Content Delivery/Internet Gateway"
  vpc_id                    = data.aws_vpc.vpc.id
  aws_internet_gateway_tags = merge(local.tags, var.aws_internet_gateway_tags)
}
locals {
  name_tag_val = join("-", [data.aws_caller_identity.current.account_id, data.aws_availability_zones.az.id])
  tags         = { Name = local.name_tag_val }
}
