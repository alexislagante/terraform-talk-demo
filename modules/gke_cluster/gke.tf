variable "gke_num_nodes" {
  default = 1
  description = "number of gke nodes"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name = local.cluster_name
  location = var.cluster_zone

  min_master_version = "1.16.11-gke.5"

  remove_default_node_pool = true
  initial_node_count = 1

  network = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name = "${google_container_cluster.primary.name}-primary"
  location = var.cluster_zone
  cluster = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.environment
    }

    preemptible = true
    machine_type = "g1-small"
    tags = [
      "gke-node",
      var.environment]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}