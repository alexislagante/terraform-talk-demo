variable "cluster_host" {
  description = "Cluster Host"
}

variable "cluster_token" {
  description = "cluster token"
}

variable "cluster_ca_certificate" {
  description = "cluster ca certificate"
}

variable "environment" {
  description = "environment"
}

variable "demo_api" {}

variable "base_domain" {}

variable "load_balancer_ip" {
  description = "static ip address of the load balancer"
}

locals {
  demo_api_name = "demo-api-${var.environment}"
}

locals {
  demo_api_image = "gcr.io/awesome-web-app/demo-api:${var.demo_api.version}"
}