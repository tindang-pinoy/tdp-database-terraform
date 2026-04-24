locals {
    project_name = var.default_values.project_name
    project_owner = var.default_values.project_owner
    project_version = var.default_values.project_version
    
    tags = var.default_values.tags

    allocated_storage = 20 # This value is in GB
    storage_type = "gp2"
    
    engine = "postgres"
    engine_version = "18.1"
    parameter_group_version = "postgres18"
    instance_class = "db.t3.micro"
    
    username = var.master_username
    
    publicly_accessible = true
    
    backup_retention_period = 7
    backup_window = "16:00-17:00"
    maintenance_window = "sun:17:00-sun:18:00"
    autominor_version_upgrade = true
    apply_immediately = true
    deletion_protection = false
    skip_final_snapshot = true
    final_snapshot_identifier = "${local.project_name}-final-snapshot"
    
    enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

    iam_database_authentication_enabled = true
}