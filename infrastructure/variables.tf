variable "aws_region" {
  description = "The AWS Region where resources will be created"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "project_owner" {
  description = "The owner of the project"
  type        = string
}

variable "project_version" {
  description = "The version of the project"
  type        = string
}

# ── Networking ────────────────────────────────────────────────────────────────

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to create public subnets in"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets (must match length of availability_zones)"
  type        = list(string)
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks permitted to reach the RDS instance on port 5432"
  type        = list(string)
}

variable "lambda_security_group_ids" {
  description = "Security group IDs of Lambda functions permitted to reach the RDS instance on port 5432"
  type        = list(string)
  default     = []
}

# ── Database ──────────────────────────────────────────────────────────────────

variable "db_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "master_username" {
  description = "The master username for the RDS instance"
  type        = string
}