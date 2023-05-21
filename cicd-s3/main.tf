

resource "aws_s3_bucket" "tf_pipeline_bucket" {                         # s3 bucket - pipelines artefacts storage
  for_each = toset(var.bucketnames)  
  bucket = "${var.project}-devops-${var.region}-${each.key}"
  acl    = "private"
}












