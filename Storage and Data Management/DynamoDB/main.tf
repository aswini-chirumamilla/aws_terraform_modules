module "create_dynamodb" {
    source = "../../../Modules/Storage and Data Management/DynamoDB"

    table_name                          = var.table_name
    attributes                          = var.attributes 
    capacity_mode                       = var.capacity_mode
    partition_key                       = var.partition_key
    sort_key                            = var.sort_key
    read_capacity                       = var.read_capacity
    write_capacity                      = var.write_capacity
    stream_enabled_dynamodb             = var.stream_enabled_dynamodb
    stream_view_type_dynamodb           = var.stream_view_type_dynamodb
    ttl_enabled                         = var.ttl_enabled
    ttl_attribute_name                  = var.ttl_attribute_name
    point_in_time_recovery_enabled      = var.point_in_time_recovery_enabled
    local_secondary_indexes             = var.local_secondary_indexes
    global_secondary_indexes            = var.global_secondary_indexes
    server_side_encryption_enabled      = var.server_side_encryption_enabled
    server_side_encryption_kms_key_arn  = var.server_side_encryption_kms_key_arn
    autoscaling_enabled                 = var.autoscaling_enabled
    autoscaling_read                    = var.autoscaling_read
    autoscaling_write                   = var.autoscaling_write
    autoscaling_indexes                 = var.autoscaling_indexes
    autoscaling_defaults                = var.autoscaling_defaults
    tags                                = var.tags
    replica_regions                     = var.replica_regions
}