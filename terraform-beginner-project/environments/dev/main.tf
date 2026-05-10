terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name_prefix = var.bucket_name_prefix
  environment        = var.environment
  project_name       = var.project_name
}