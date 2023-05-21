module "awsflowlogs" {
  source                     = "../../../Modules/Networking & Content Delivery/aws flow logs"
  log_destination            = var.log_destination
  traffic_type               = var.traffic_type
  iam_role_arn               = var.iam_role_arn
  vpc_id                     = var.vpc_id
  log_destination_type       = var.log_destination_type
  eni_id                     = var.eni_id
  #log_format                = var.log_format
  max_aggregation_interval   = var.max_aggregation_interval
  destination_options        = var.destination_options
  tags                       = var.tags
  file_format                = var.file_format
  hive_compatible_partitions = var.hive_compatible_partitions
  per_hour_partition         = var.per_hour_partition

}
