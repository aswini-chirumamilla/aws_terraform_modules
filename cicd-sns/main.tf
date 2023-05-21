resource "aws_sns_topic" "tf_pipeline_approvers_sns" {          # SNSTOPIC
  name = "${var.project}-devops-pipeline-approval"
  kms_master_key_id = "alias/aws/sns"
  tags = {                                                            
    Terraform = "true"
  }
}