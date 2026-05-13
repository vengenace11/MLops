variable "region_primary" { type = string }
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "ami_id" { type = string }
variable "instance_count" { type = number }