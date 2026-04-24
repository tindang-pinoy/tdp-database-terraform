resource "aws_db_instance" "tdp_database_instance" {
  identifier           = var.db_identifier
  db_name              = var.db_name
  allocated_storage    = local.allocated_storage
  storage_type         = local.storage_type
  engine               = local.engine
  engine_version       = local.engine_version
  parameter_group_name = aws_db_parameter_group.tdp_database_parameter_group.name

  instance_class = local.instance_class

  username                    = local.username
  manage_master_user_password = true

  publicly_accessible = local.publicly_accessible

  backup_retention_period = local.backup_retention_period
  backup_window           = local.backup_window
  maintenance_window      = local.maintenance_window

  auto_minor_version_upgrade = local.autominor_version_upgrade
  apply_immediately          = local.apply_immediately

  deletion_protection = local.deletion_protection
  skip_final_snapshot = local.skip_final_snapshot

  enabled_cloudwatch_logs_exports     = local.enabled_cloudwatch_logs_exports
  iam_database_authentication_enabled = local.iam_database_authentication_enabled

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = local.tags
}

resource "aws_db_parameter_group" "tdp_database_parameter_group" {
  name        = "${local.project_name}-rds-parameter-group"
  family      = local.parameter_group_version
  description = "Custom parameter group for ${local.project_name} RDS instance"

  parameter {
    name  = "log_connections"
    value = "all"
  }

  parameter {
    name  = "log_disconnections"
    value = "1"
  }

  parameter {
    name  = "log_statement"
    value = "ddl"
  }

  parameter {
    name  = "log_min_duration_statement"
    value = "1000" # Log statements that take longer than 1000ms
  }

  parameter {
    name  = "log_error_verbosity"
    value = "default"
  }

  parameter {
    name  = "log_line_prefix"
    value = "%m:%r:%u@%d:[%p]:%l:%e:%s:%v:%x:%c:%q%a:"
  }

  tags = local.tags
}

# -------------------------------------------------------
# SSM — publish RDS connection details for downstream
# projects to consume without coupling to this state file
# -------------------------------------------------------
resource "aws_ssm_parameter" "db_endpoint" {
  name        = "/${local.project_name}/rds/endpoint"
  type        = "String"
  value       = aws_db_instance.tdp_database_instance.address
  description = "RDS hostname for ${local.project_name} — host only, no port"
  tags        = local.tags
}

resource "aws_ssm_parameter" "db_name" {
  name        = "/${local.project_name}/rds/db-name"
  type        = "String"
  value       = aws_db_instance.tdp_database_instance.db_name
  description = "RDS database name for ${local.project_name}"
  tags        = local.tags
}

resource "aws_ssm_parameter" "db_secret_arn" {
  name        = "/${local.project_name}/rds/secret-arn"
  type        = "String"
  value       = aws_db_instance.tdp_database_instance.master_user_secret[0].secret_arn
  description = "Secrets Manager ARN holding the RDS master user credentials for ${local.project_name}"
  tags        = local.tags
}

resource "aws_ssm_parameter" "db_instance_arn" {
  name        = "/${local.project_name}/rds/instance-arn"
  type        = "String"
  value       = aws_db_instance.tdp_database_instance.arn
  description = "RDS instance ARN for ${local.project_name}"
  tags        = local.tags
}

# Used by Lambda projects to scope rds-db:connect IAM policies
resource "aws_ssm_parameter" "db_resource_id" {
  name        = "/${local.project_name}/rds/resource-id"
  type        = "String"
  value       = aws_db_instance.tdp_database_instance.resource_id
  description = "RDS resource ID for ${local.project_name} — used in rds-db:connect IAM policy ARNs"
  tags        = local.tags
}
