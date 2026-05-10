output "s3_bucket_name" {
  description = "Created S3 bucket name"
  value       = module.s3_bucket.bucket_name
}

# output "security_group_id" {
#   description = "Created security group ID"
#   value       = module.security_group.security_group_id
# }

# output "ec2_instance_id" {
#   description = "Created EC2 instance ID"
#   value       = module.ec2_instance.instance_id
# }

# output "ec2_public_ip" {
#   description = "Public IP address of EC2 instance"
#   value       = module.ec2_instance.public_ip
# }

# output "ssh_command" {
#   description = "SSH command to connect to the EC2 instance"
#   value       = "ssh -i <your-key-file.pem> ubuntu@${module.ec2_instance.public_ip}"
# }