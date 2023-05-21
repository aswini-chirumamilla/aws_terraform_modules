output "sns-pipeline-approval" {
  value = aws_sns_topic.tf_pipeline_approvers_sns
  description = "pipeline approval sns topic"
}