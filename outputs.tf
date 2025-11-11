output "arn" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#arn"
  value       = var.enabled ? aws_neptune_cluster.this[0].arn : ""
}

output "cluster_identifier" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#cluster_identifier"
  value       = var.enabled ? aws_neptune_cluster.this[0].cluster_identifier : ""
}

output "cluster_resource_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#cluster_resource_id"
  value       = var.enabled ? aws_neptune_cluster.this[0].cluster_resource_id : ""
}

output "cluster_members" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#cluster_members"
  value       = var.enabled ? aws_neptune_cluster.this[0].cluster_members : []
}

output "endpoint" {
  depends_on  = [aws_neptune_cluster_instance.this]
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#endpoint"
  value       = var.enabled ? aws_neptune_cluster.this[0].endpoint : ""
}

output "port" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance#port"
  value       = var.enabled ? aws_neptune_cluster.this[0].port : ""
}

output "reader_endpoint" {
  depends_on  = [aws_neptune_cluster_instance.this]
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#reader_endpoint"
  value       = var.enabled ? aws_neptune_cluster.this[0].reader_endpoint : ""
}

output "security_group_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#id"
  value       = var.enabled ? aws_security_group.neptune[0].id : ""
}