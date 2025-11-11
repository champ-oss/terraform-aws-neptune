resource "aws_security_group" "neptune" {
  count       = var.enabled ? 1 : 0
  name_prefix = "${var.cluster_identifier_prefix}-neptune-"
  vpc_id      = var.vpc_id
  tags        = merge(local.tags, var.tags)

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_vpc_security_group_ingress_rule" "from_sg" {
  count                            = var.enabled && var.enable_source_security_group ? 1 : 0
  description                      = "ingress from security group"
  from_port                        = 8182
  to_port                          = 8182
  ip_protocol                      = "tcp"
  security_group_id                = aws_security_group.neptune[0].id
  referenced_security_group_id     = var.source_security_group_id
}