output "db_instance_id" {
  description = "The RDS instance identifier"
  value       = aws_db_instance.tdp_database_instance.identifier
}

output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS instance"
  value       = aws_db_instance.tdp_database_instance.endpoint
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = aws_db_instance.tdp_database_instance.arn
}

output "db_master_user_secret_arn" {
  description = "The ARN of the Secrets Manager secret holding the master user password"
  value       = aws_db_instance.tdp_database_instance.master_user_secret[0].secret_arn
}

# ── SSM paths ─────────────────────────────────────────────────────────────────

output "db_endpoint_ssm_path" {
  description = "SSM path: RDS connection endpoint"
  value       = aws_ssm_parameter.db_endpoint.name
}

output "db_name_ssm_path" {
  description = "SSM path: database name"
  value       = aws_ssm_parameter.db_name.name
}

output "db_secret_arn_ssm_path" {
  description = "SSM path: Secrets Manager ARN for master user credentials"
  value       = aws_ssm_parameter.db_secret_arn.name
}

output "db_instance_arn_ssm_path" {
  description = "SSM path: RDS instance ARN"
  value       = aws_ssm_parameter.db_instance_arn.name
}

output "db_resource_id_ssm_path" {
  description = "SSM path: RDS resource ID (for rds-db:connect IAM policy ARNs)"
  value       = aws_ssm_parameter.db_resource_id.name
}
