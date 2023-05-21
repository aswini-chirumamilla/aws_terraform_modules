terraform {
  required_version = ">= 1.3.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.55.0"
    }
  }
}

#provider described
provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}