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

variable "core_infrastructure_project_name" {
  description = "The name of the core infrastructure project to reference for dependencies"
  type        = string
}