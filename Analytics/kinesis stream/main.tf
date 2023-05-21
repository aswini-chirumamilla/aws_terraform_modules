module "kinesis_stream" {
  source                    = "../../../Modules/Analytics/kinesis_stream"
  kinesis_stream            = var.kinesis_stream
  shard_count               = var.shard_count
  retention_period          = var.retention_period
  enforce_consumer_deletion = var.enforce_consumer_deletion
  encryption_type           = var.encryption_type
  kms_key_id                = var.kms_key_id
  stream_mode_details       = var.stream_mode_details
  shard_level_metrics       = var.shard_level_metrics
  stream_mode               = var.stream_mode
  tags                      = var.tags
  stream_consumer           = var.stream_consumer
}
