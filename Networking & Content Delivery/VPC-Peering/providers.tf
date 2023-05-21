terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
  # Requester's credentials.
}

provider "aws" {
  alias   = "peer"
  region  = var.peer_region
  profile = "arul"
  # Accepter's credentials.
}