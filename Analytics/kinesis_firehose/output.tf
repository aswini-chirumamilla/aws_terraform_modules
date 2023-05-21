output "extended_s3_stream" {
  value       = aws_kinesis_firehose_delivery_stream.extended_s3_stream.arn
  description = "kinesis firehose stream id"
}
output "extended_s3_stream_dynamic" {
  value       = aws_kinesis_firehose_delivery_stream.extended_s3_stream_dynamic.arn
  description = "kinesis firehose stream id"
}
output "redshift" {
  value       = aws_kinesis_firehose_delivery_stream.redshift.arn
  description = "kinesis firehose stream id"
}
output "elasticsearch" {
  value       = aws_kinesis_firehose_delivery_stream.redshift.arn
  description = "kinesis firehose stream id"
}
output "HTTP_endpoint" {
  value       = aws_kinesis_firehose_delivery_stream.HTTP_endpoint.arn
  description = "kinesis firehose stream id"
}
