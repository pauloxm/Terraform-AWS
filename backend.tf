terraform {
  required_version = "~> 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta1"
    }
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      "owner"       = "Paulo Xavier"
      "Provisioner" = "Terraform"
    }
  }
}