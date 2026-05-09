variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile used for authentication"
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, test, staging, or prod"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "bucket_name_prefix" {
  description = "Prefix for the S3 bucket name"
  type        = string
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Existing AWS key pair name for SSH access"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}