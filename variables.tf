
variable "allow_major_version_upgrade" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#allow_major_version_upgrade"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#backup_retention_period"
  type        = number
  default     = 35
}

variable "cluster_identifier_prefix" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#cluster_identifier_prefix"
  type        = string
  default     = "neptunedb-test"
}

variable "cluster_instance_count" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance"
  type        = number
  default     = 1
}

variable "cluster_instance_class" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance"
  type        = string
  default     = "db.t3.medium"
}

variable "cidr_blocks" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule#cidr_blocks"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  type        = bool
  default     = true
}

variable "db_snapshot_source_arn" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/db_snapshot#db_instance_identifier"
  type        = string
  default     = null
}

variable "enable_source_security_group" {
  description = "Enable source security group"
  type        = bool
  default     = true
}

variable "engine_version" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#engine_version"
  type        = string
  default     = "1.4.5.1"
}

variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-neptune"
}

variable "iam_database_authentication_enabled" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#iam_database_authentication_enabled"
  default     = true
  type        = bool
}

variable "max_capacity" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#max_capacity"
  type        = number
  default     = 8 # each ACU corresponds to approximately 2 GiB of memory
}

variable "min_capacity" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#min_capacity"
  type        = number
  default     = 0.5
}
variable "seconds_until_auto_pause" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#seconds_until_auto_pause"
  type        = number
  default     = null
}

variable "preferred_backup_window" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#preferred_backup_window"
  type        = string
  default     = "06:00-06:30"
}

variable "private_subnet_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group#subnet_ids"
  type        = list(string)
}

variable "protect" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#deletion_protection"
  default     = true
  type        = bool
}

variable "skip_final_snapshot" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster#skip_final_snapshot"
  default     = false
  type        = bool
}

variable "source_security_group_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule#source_security_group_id"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id"
  type        = string
}