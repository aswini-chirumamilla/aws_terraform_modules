terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
  }
}

provider "aws" {
  # Configuration options
  profile = var.aws_profile
  region  = var.aws_region
}