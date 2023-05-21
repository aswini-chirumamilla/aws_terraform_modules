output "kinesis_stream_arn" {
  value       = aws_kinesis_stream.kinesis_stream.arn
  description = "kinesis stream id"
}
output "stream_consumer_arn" {
  value       = aws_kinesis_stream_consumer.stream_consumer.arn
  description = "kinesis stream id"
}
