output "bucket_arn" {
  description = "ARN of the S3 bucket"
  value = module.S3.bucket_arn
}

output "bucket_id" {
  description = "ID of the S3 bucket"
  value       = module.S3.bucket_id
}
