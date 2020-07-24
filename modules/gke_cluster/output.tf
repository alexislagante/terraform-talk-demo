data "google_client_config" "provider" {}

output "cluster_host" {
  value = "https://${google_container_cluster.primary.endpoint}"
}

output "cluster_token" {
  value = data.google_client_config.provider.access_token
}

output "cluster_ca_certificate" {
  value = base64decode(
  google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
}

output "load_balancer_ip" {
  value = google_compute_address.load_balancer_ip.address
}