resource "aws_db_instance" "tdp_database_instance" {
    identifier = var.db_identifier
    db_name = var.db_name
    
    allocated_storage = local.allocated_storage
    storage_type = local.storage_type
    engine = local.engine
    engine_version = local.engine_version
    parameter_group_name = aws_db_parameter_group.tdp_database_parameter_group.name

    instance_class = local.instance_class
    
    username = local.username
    manage_master_user_password = true
    
    db_subnet_group_name = aws_db_subnet_group.tdp_database_subnet_group.name
    vpc_security_group_ids = var.vpc_security_group_ids
    publicly_accessible = local.publicly_accessible

    backup_retention_period = local.backup_retention_period
    backup_window = local.backup_window
    maintenance_window = local.maintenance_window

    auto_minor_version_upgrade = local.autominor_version_upgrade
    apply_immediately = local.apply_immediately

    deletion_protection = local.deletion_protection
    skip_final_snapshot = local.skip_final_snapshot

    enabled_cloudwatch_logs_exports = local.enabled_cloudwatch_logs_exports

    tags = local.tags
}

# Enable the Apatite RDS Subnet Group
resource "aws_db_subnet_group" "tdp_database_subnet_group" {
    name = "${var.db_identifier}-subnet-group"
    subnet_ids = var.subnet_ids
    tags = local.tags
}

# Enable the Database Parameter Group
resource "aws_db_parameter_group" "tdp_database_parameter_group" {
    name        = "${local.project_name}-rds-parameter-group"
    family      = local.parameter_group_version

    parameter {
        name  = "log_connections"
        value = "all"
    }
    parameter {
        name = "log_disconnections"
        value = "1"
    }
    parameter {
        name = "log_statement"
        value = "ddl"
    }
    parameter {
        name = "log_min_duration_statement"
        value = "1000" # Log statements that take longer than 1000ms
    }
    parameter {
      name = "log_error_verbosity"
      value = "default"
    }
    parameter {
      name = "log_line_prefix"
      value = "%m:%r:%u@%d:[%p]:%l:%e:%s:%v:%x:%c:%q%a:"
    }

    description = "Custom parameter group for Apatite RDS Instance"
    tags = merge(local.tags)
}