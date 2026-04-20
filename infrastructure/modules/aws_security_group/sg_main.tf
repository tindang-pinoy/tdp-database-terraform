resource "aws_security_group" "tdp_rds_sg" {
  name        = "${local.project_name}-rds-sg"
  description = "Security group for the ${local.project_name} RDS instance"
  vpc_id      = var.vpc_id

  tags = merge(local.tags, {
    Name = "${local.project_name}-rds-sg"
  })
}

resource "aws_vpc_security_group_ingress_rule" "postgres" {
  security_group_id = aws_security_group.tdp_rds_sg.id
  description       = "Allow inbound PostgreSQL traffic"

  for_each    = toset(var.allowed_cidr_blocks)
  cidr_ipv4   = each.value
  from_port   = local.db_port
  to_port     = local.db_port
  ip_protocol = "tcp"

  tags = local.tags
}

resource "aws_vpc_security_group_ingress_rule" "lambda" {
  security_group_id = aws_security_group.tdp_rds_sg.id
  description       = "Allow inbound PostgreSQL traffic from Lambda"

  for_each                     = toset(var.lambda_security_group_ids)
  referenced_security_group_id = each.value
  from_port                    = local.db_port
  to_port                      = local.db_port
  ip_protocol                  = "tcp"

  tags = local.tags
}

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.tdp_rds_sg.id
  description       = "Allow all outbound traffic"

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = local.tags
}
