output "security_group_id" {
  description = "The ID of the RDS security group"
  value       = aws_security_group.tdp_rds_sg.id
}

output "security_group_arn" {
  description = "The ARN of the RDS security group"
  value       = aws_security_group.tdp_rds_sg.arn
}
