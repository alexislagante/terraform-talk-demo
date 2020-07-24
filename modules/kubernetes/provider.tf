provider "kubernetes" {
  load_config_file = false

  host  = var.cluster_host
  token = var.cluster_token
  cluster_ca_certificate = var.cluster_ca_certificate
}