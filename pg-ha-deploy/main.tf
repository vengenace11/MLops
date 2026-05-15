module "pg_cluster_region_a" {
  source         = "./modules/ec2-pg"
  providers      = { aws = aws.primary }
  region_name    = var.region_primary
  vpc_id         = var.vpc_id_a
  subnet_ids     = var.subnets_a
  ami_id         = var.ami_a
  instance_count = 3
}

# module "pg_cluster_region_b" {
#   source           = "./modules/ec2-pg"
#   providers      = { aws = aws.secondary }
#   region_name    = var.region_secondary
#   vpc_id          = var.vpc_id_b
#   subnet_ids       = var.subnets_b
#   ami_id           = var.ami_b
#   instance_count   = 3
# }