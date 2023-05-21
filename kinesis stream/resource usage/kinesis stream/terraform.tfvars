aws_region                = "us-east-1"
aws_profile               = "Aswini"
kinesis_stream            = "cilkinesis"
shard_count               = 1
retention_period          = 48
enforce_consumer_deletion = false
encryption_type           = "KMS"
stream_mode_details       = "PROVISIONED"
shard_level_metrics       = ["IncomingBytes","OutgoingBytes",]
kms_key_id                = "alias/aws/kinesis"
stream_mode               = "PROVISIONED"
stream_consumer           = "cilconsumer"
tags = {
  Name = "kinesis stream"
  aws_region = "us-east-1"
}

