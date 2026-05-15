terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region_primary
  alias  = "primary"
  # Optional: profile = "your-aws-profile-name"
}

# provider "aws" {
#   region = var.region_secondary
#   alias  = "secondary"
# }