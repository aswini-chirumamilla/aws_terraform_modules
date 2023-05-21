output "video_stream_arn" {
  description = "Kinesis video stream id"
  value       = aws_kinesis_video_stream.video_stream.arn
}