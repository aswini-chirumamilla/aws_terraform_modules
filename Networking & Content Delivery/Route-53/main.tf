module "aws_route53_zone" {
  source                        = "../../../Modules/Networking & Content Delivery/Route-53"
  reference_name                = var.reference_name
  name                          = var.name
  comment                       = var.comment
  tags                          = var.tags
  vpc_id                        = var.vpc_id
  vpc_region                    = var.vpc_region
  aws_route53_record            = var.aws_route53_record
  policy_name                   = var.policy_name
  policy_path                   = var.policy_path
  enable_logging                = var.enable_logging
  retention_in_days             = var.retention_in_days
  aws_cloudwatch_log_group_name = var.aws_cloudwatch_log_group_name
  association_vpc_ids           = var.association_vpc_ids

}
