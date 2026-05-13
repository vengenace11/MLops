variable "region_primary" { type = string }
variable "region_secondary" { type = string }

variable "vpc_id_a" { type = string }
variable "subnets_a" { type = list(string) }
variable "ami_a" { type = string }

variable "vpc_id_b" { type = string }
variable "subnets_b" { type = list(string) }
variable "ami_b" { type = string }