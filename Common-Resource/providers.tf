terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.8"
    }
  }
}
#provider described
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region

}

terraform {
  backend "s3" {
    bucket         = "awscilbucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "awscildb"
  }
}