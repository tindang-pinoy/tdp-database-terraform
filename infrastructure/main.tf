module "rds" {
  source = "./modules/aws_rds"

  default_values         = local.default_values
  db_identifier          = var.db_identifier
  db_name                = var.db_name
  master_username        = var.master_username
  vpc_security_group_ids = [data.aws_ssm_parameter.rds_sg_id.value]
}
