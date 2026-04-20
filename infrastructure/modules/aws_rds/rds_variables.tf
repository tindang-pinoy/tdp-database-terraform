variable "default_values" {
  description = "A map of default values for the infrastructure"
  type        = object({
    project_name = string
    project_owner = string
    project_version = string
    tags = map(string)
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

variable "subnet_ids" {
    description = "A list of public subnet IDs for the RDS subnet group"
    type        = list(string)
}

variable "vpc_security_group_ids" {
    description = "A list of VPC security group IDs for the RDS instance"
    type        = list(string)
}