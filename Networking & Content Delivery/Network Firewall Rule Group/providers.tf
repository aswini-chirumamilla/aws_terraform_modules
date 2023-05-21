terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "terraform"
  region  = "us-east-2"
}