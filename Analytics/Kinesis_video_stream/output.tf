output "video_stream_arn" {
  value       = aws_kinesis_video_stream.video_stream.arn
  description = "kinesis video stream id"
}