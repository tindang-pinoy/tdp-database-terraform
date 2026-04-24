# -------------------------------------------------------
# SSM lookups from core-infrastructure
# All cross-project dependencies are resolved here so
# the rest of the configuration stays free of data sources
# -------------------------------------------------------
data "aws_ssm_parameter" "rds_sg_id" {
  name = "/${var.core_infrastructure_project_name}/security-groups/rds-sg-id"
}
