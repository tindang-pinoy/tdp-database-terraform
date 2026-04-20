output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = module.vpc.public_subnet_ids
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = module.vpc.internet_gateway_id
}

output "security_group_id" {
  description = "The ID of the RDS security group"
  value       = module.security_group.security_group_id
}

output "security_group_arn" {
  description = "The ARN of the RDS security group"
  value       = module.security_group.security_group_arn
}

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
