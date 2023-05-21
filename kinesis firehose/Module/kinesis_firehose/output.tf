output "extended_s3_stream" {
  description = "Kinesis firehose stream id"
  value       = try(aws_kinesis_firehose_delivery_stream.extended_s3_stream.*.arn, "")
}

output "extended_s3_stream_dynamic" {
  description = "Kinesis firehose stream id"
  value       = try(aws_kinesis_firehose_delivery_stream.extended_s3_stream_dynamic.*.arn, "")
}

output "redshift" {
  description = "kinesis firehose stream id"
  value       = try(aws_kinesis_firehose_delivery_stream.redshift.*.arn, "")
}

output "elasticsearch" {
  description = "Kinesis firehose stream id"
  value       = try(aws_kinesis_firehose_delivery_stream.elasticsearch.*.arn, "")
}

output "HTTP_endpoint" {
  description = "kinesis firehose stream id"
  value       = try(aws_kinesis_firehose_delivery_stream.HTTP_endpoint.*.arn, "")
}
