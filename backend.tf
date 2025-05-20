terraform {
  required_version = "~> 1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket = "prxm-remote-state"
    key    = "instance/terraform.tfstate"
    region = "sa-east-1"
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