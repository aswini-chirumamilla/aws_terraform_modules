terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48"
    }
  }

  required_version = ">= 1.3.7"
}

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}
