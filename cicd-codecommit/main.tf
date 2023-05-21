resource "aws_codecommit_repository" "tf_repo" {
  for_each = toset(var.microservicelist)  
  repository_name = "${var.project}-${each.key}"
  description     = "${var.project}-${each.key} microservice"
  tags = {                                                            
    Terraform = "true"
  } 
}


