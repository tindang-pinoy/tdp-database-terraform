variable "default_values" {
  description = "A map of default values for the infrastructure"
  type = object({
    project_name    = string
    project_owner   = string
    project_version = string
    tags            = map(string)
  })
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones to create public subnets in (must match length of public_subnet_cidrs)"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for the public subnets (must match length of availability_zones)"
  type        = list(string)
}
