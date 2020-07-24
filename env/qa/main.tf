variable "cloudflare_settings" {}

module "gke_cluster" {
  source = "../../modules/gke_cluster"

  environment = "qa"
  project_id = "awesome-web-app"
  region = "us-east1"
  cluster_zone = "us-east1-c"
  cluster_name = "awesome-webapp"
  gke_num_nodes = 1

  cloudflare_settings = var.cloudflare_settings
}

module "kubernetes" {
  source = "../../modules/kubernetes"

  cluster_host = module.gke_cluster.cluster_host
  cluster_token = module.gke_cluster.cluster_token
  cluster_ca_certificate = module.gke_cluster.cluster_ca_certificate
  environment = "qa"

  base_domain = "qa.awesomeweb.app"
  load_balancer_ip = module.gke_cluster.load_balancer_ip

  demo_api = {
    version =  "1.1"
    replicas = 1
  }
}