terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
}

# resource "aws_iam_role" "pg_role" {
#   name = "pg-role-${var.region_name}"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Principal = { Service = "ec2.amazonaws.com" } }]
#   })
# }

# resource "aws_iam_role_policy" "consul_discovery" {
#   name = "consul-discovery"
#   role = aws_iam_role.pg_role.id
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [{ Action = "ec2:DescribeInstances", Effect = "Allow", Resource = "*" }]
#   })
# }

# resource "aws_iam_instance_profile" "pg_profile" {
#   name = "pg-profile-${var.region_name}"
#   role = aws_iam_role.pg_role.name
# }

resource "aws_instance" "pg_node" {
  count                = var.instance_count
  ami                  = var.ami_id
  instance_type        = "t3.micro"
  subnet_id            = var.subnet_ids[count.index % length(var.subnet_ids)]
  # iam_instance_profile = aws_iam_instance_profile.pg_profile.name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y postgresql patroni consul haproxy prometheus-postgres-exporter
              # Configuration logic for Patroni (DCS: Consul) goes here
              EOF

  tags = {
    Name    = "pg-node-${var.region_name}-${count.index}"
    Cluster = "pg-prod"
  }
}