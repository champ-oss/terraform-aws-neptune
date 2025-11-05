locals {
  snapshot_timestamp = formatdate("'pg-${var.cluster_identifier_prefix}-'YYYYMMDDHHmmss", timestamp())
  db_snapshot_source = var.db_snapshot_source_arn != null ? data.aws_db_snapshot.this[0].id : null

  # 60 character max length with 27 character random suffix
  cluster_identifier_prefix = trimsuffix("neptune-${substr(var.cluster_identifier_prefix, 0, 30)}", "-")


  tags = {
    cost    = "neptune"
    creator = "terraform"
    git     = var.git
  }
