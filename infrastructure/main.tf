module "vpc" {
  source = "./modules/aws_vpc"

  default_values      = local.default_values
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "security_group" {
  source = "./modules/aws_security_group"

  default_values      = local.default_values
  vpc_id              = module.vpc.vpc_id
  allowed_cidr_blocks       = var.allowed_cidr_blocks
  lambda_security_group_ids = var.lambda_security_group_ids
}

module "rds" {
  source = "./modules/aws_rds"

  default_values         = local.default_values
  db_identifier          = var.db_identifier
  db_name                = var.db_name
  master_username        = var.master_username
  subnet_ids             = module.vpc.public_subnet_ids
  vpc_security_group_ids = [module.security_group.security_group_id]
}
