terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.3"
    }
  }
}
#provider described
provider "aws" {
  profile = var.profile
  region  = var.region

}