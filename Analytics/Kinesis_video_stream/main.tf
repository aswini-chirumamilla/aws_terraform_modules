resource "aws_kinesis_video_stream" "video_stream" {
  name                    = var.video_stream
  data_retention_in_hours = var.data_retention_in_hours
  device_name             = var.device_name
  media_type              = var.media_type
  kms_key_id              = var.kms_key_id
  tags                    = var.tags
  
}
