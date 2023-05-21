terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4"
    }
  }
}
provider "aws" {
  # Configuration options
  region  = var.region
  profile = var.profile
}

