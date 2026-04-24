# ── RDS ───────────────────────────────────────────────────────────────────────

output "db_instance_id" {
  description = "The RDS instance identifier"
  value       = module.rds.db_instance_id
}

output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = module.rds.db_instance_endpoint
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.rds.db_instance_arn
}

output "db_master_user_secret_arn" {
  description = "The ARN of the Secrets Manager secret holding the master user password"
  value       = module.rds.db_master_user_secret_arn
}

# ── SSM paths — consume these in downstream projects ──────────────────────────

output "db_endpoint_ssm_path" {
  description = "SSM path: RDS connection endpoint"
  value       = module.rds.db_endpoint_ssm_path
}

output "db_name_ssm_path" {
  description = "SSM path: database name"
  value       = module.rds.db_name_ssm_path
}

output "db_secret_arn_ssm_path" {
  description = "SSM path: Secrets Manager ARN for master user credentials"
  value       = module.rds.db_secret_arn_ssm_path
}

output "db_instance_arn_ssm_path" {
  description = "SSM path: RDS instance ARN"
  value       = module.rds.db_instance_arn_ssm_path
}

output "db_resource_id_ssm_path" {
  description = "SSM path: RDS resource ID (for rds-db:connect IAM policy ARNs)"
  value       = module.rds.db_resource_id_ssm_path
}
