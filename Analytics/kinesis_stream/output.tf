output "kinesis_stream_arn" {
  description = "Kinesis stream id"
  value       = aws_kinesis_stream.kinesis_stream.arn
}

output "stream_consumer_arn" {
  description = "Kinesis stream consumer id"
  value       = aws_kinesis_stream_consumer.stream_consumer.arn
}
