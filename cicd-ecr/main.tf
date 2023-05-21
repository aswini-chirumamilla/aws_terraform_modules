resource "aws_ecr_repository" "tf_ecr" {            # ECR-REPOS 
  for_each = toset(var.microservicelist)  
  name                 = "${var.project}-${each.key}"
  image_tag_mutability = "IMMUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
    encryption_type = "KMS"
    kms_key = "alias/aws/ecr"
  }
  tags = {                                                           
    Terraform = "true"
  }

}


