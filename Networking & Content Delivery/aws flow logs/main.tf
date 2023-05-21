resource "aws_flow_log" "flow_log" {
  iam_role_arn                  = var.iam_role_arn
  log_destination               = var.log_destination
  traffic_type                  = var.traffic_type
  vpc_id                        = var.vpc_id
  eni_id                        = var.eni_id
  log_destination_type          = var.log_destination_type
  subnet_id                     = var.subnet_id
  transit_gateway_id            = var.transit_gateway_id
  transit_gateway_attachment_id = var.transit_gateway_attachment_id
  log_format                    = var.log_format
  max_aggregation_interval      = var.max_aggregation_interval
  tags                          = var.tags

  dynamic "destination_options" {
    for_each = var.destination_options != null ? [1] : []
    content {
      file_format                = var.file_format
      hive_compatible_partitions = var.hive_compatible_partitions
      per_hour_partition         = var.per_hour_partition

    }
  }


}
