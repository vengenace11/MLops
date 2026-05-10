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

# data "aws_vpc" "default" {
  default = true
# }

# data "aws_subnets" "default" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.default.id]
#   }
# }

# # data "aws_ami" "ubuntu" {
# #   most_recent = true
# #   owners      = ["099720109477"]

# #   filter {
# #     name   = "name"
# #     values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
# #   }

# #   filter {
# #     name   = "virtualization-type"
# #     values = ["hvm"]
# #   }
# # }

module "s3_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name_prefix = var.bucket_name_prefix
  environment        = var.environment
  project_name       = var.project_name
}

# # module "security_group" {
#   source = "../../modules/security_group"

#   security_group_name = var.security_group_name
#   vpc_id              = data.aws_vpc.default.id
#   allowed_ssh_cidr    = var.allowed_ssh_cidr
#   environment         = var.environment
#   project_name        = var.project_name
# }

# # module "ec2_instance" {
#   source = "../../modules/ec2_instance"

# #   ami_id             = data.aws_ami.ubuntu.id
# #   instance_type      = var.instance_type
# #   subnet_id          = data.aws_subnets.default.ids[0]
# #   security_group_ids = [module.security_group.security_group_id]
# #   key_name           = var.key_name
# #   instance_name      = var.instance_name
# #   environment        = var.environment
# #   project_name       = var.project_name
# }