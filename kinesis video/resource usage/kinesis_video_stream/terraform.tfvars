aws_region              = "us-east-1"
aws_profile             = "Terraform"
video_stream            = "cilvideostream"
data_retention_in_hours = 2
device_name             = "data_stream"
media_type              = "video/h264"
kms_key_id              = "aws/kinesisvideo"
tags = {
  name    = "video stream"
  aws_region = "us-east-1"
}
