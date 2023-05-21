output "AWS_CloudTrail_ARN" {
  value       = aws_cloudtrail.new_trail.ARN
  description = "ARN OF AWS CloudTrail"

}

