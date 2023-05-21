output "pipeline-bucket-s3" {
  value = aws_s3_bucket.tf_pipeline_bucket[*]
  description = "S3 bucket for pipeline artefacts storage"
}
