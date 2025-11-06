resource "aws_neptune_cluster" "this" {
  count                               =  var.enabled ? 1 : 0
  cluster_identifier                  = "neptune-test-cluster"
  cluster_identifier_prefix           = "${local.cluster_identifier_prefix}-"
  engine                              = "neptune"
  engine_version                      = var.engine_version
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  backup_retention_period             = var.backup_retention_period
  preferred_backup_window             = var.preferred_backup_window
  skip_final_snapshot                 = var.skip_final_snapshot
  final_snapshot_identifier           = false
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  iam_roles                           = [aws_iam_role.neptune_s3_test_role.arn]
  apply_immediately                   = !var.protect
  vpc_security_group_ids              = [aws_security_group.neptune[0].id]
  neptune_subnet_group_name           = aws_db_subnet_group.this[0].id
  tags                                = merge(local.tags, var.tags)

  lifecycle {
    ignore_changes = [
      availability_zones,
      final_snapshot_identifier,
      engine_version,
      cluster_identifier_prefix
    ]
  }
} 

#Provisioned instance under neptune cluster
resource "aws_neptune_cluster_instance" "neptune_test_instance_writer" {
  count                        = var.enabled ? var.cluster_instance_count : 0
  cluster_identifier           = aws_neptune_cluster.this[0].id
  identifier_prefix            = "${local.cluster_identifier_prefix}-"
  engine                       = aws_neptune_cluster.this[0].engine
  instance_class               = var.cluster_instance_class
  apply_immediately            = true
  tags                         = merge(local.tags, var.tags)
  lifecycle {
    ignore_changes = [
      engine_version,
      identifier_prefix
    ]
  }
}

  