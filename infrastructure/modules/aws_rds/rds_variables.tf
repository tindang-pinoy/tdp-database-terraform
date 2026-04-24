variable "default_values" {
  description = "Common project values and tags"
  type = object({
    project_name    = string
    project_owner   = string
    project_version = string
    tags            = map(string)
  })
}

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

variable "vpc_security_group_ids" {
  description = "VPC security group IDs to attach to the RDS instance"
  type        = list(string)
  default     = []
}
