variable "default_values" {
  description = "A map of default values for the infrastructure"
  type = object({
    project_name    = string
    project_owner   = string
    project_version = string
    tags            = map(string)
  })
}

variable "vpc_id" {
  description = "The VPC ID in which to create the security group"
  type        = string
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
