terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.aws_region
  profile = var.aws_profile
}