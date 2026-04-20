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
