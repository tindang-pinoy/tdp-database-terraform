locals {
  project_name    = var.default_values.project_name
  project_owner   = var.default_values.project_owner
  project_version = var.default_values.project_version

  tags = merge(var.default_values.tags)

  # Zip availability_zones and public_subnet_cidrs into a map keyed by AZ
  subnet_map = { for idx, az in var.availability_zones : az => var.public_subnet_cidrs[idx] }
}
