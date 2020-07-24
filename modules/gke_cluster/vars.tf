variable "environment" {
  description = "environment"
}

variable "project_id" {
  description = "project id"
}

variable "cluster_name" {
  description = "cluster name"
}

variable "region" {
  description = "region"
}

variable "cluster_zone" {
  description = "cluster zone"
}

variable "cloudflare_settings" {}

locals {
  cluster_name = "${var.cluster_name}-${var.environment}"
}