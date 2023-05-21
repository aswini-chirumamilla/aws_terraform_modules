##### kinesis stream #####

resource "aws_kinesis_stream" "kinesis_stream" {
  name                      = var.kinesis_stream
  shard_count               = var.shard_count
  retention_period          = var.retention_period
  enforce_consumer_deletion = var.enforce_consumer_deletion
  encryption_type           = var.encryption_type
  kms_key_id                = var.kms_key_id
  tags                      = var.tags
  shard_level_metrics       = var.shard_level_metrics 
  dynamic "stream_mode_details" {
    for_each = var.stream_mode_details != null ? [var.stream_mode_details] : []
    content {
      stream_mode = var.stream_mode
    }
  }
}

######  kinesis stream consumer #######

resource "aws_kinesis_stream_consumer" "stream_consumer" {
  name       = var.stream_consumer
  stream_arn = aws_kinesis_stream.kinesis_stream.arn
}
