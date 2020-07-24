provider "helm" {
  kubernetes {
    load_config_file = false

    host = var.cluster_host
    token = var.cluster_token
    cluster_ca_certificate = var.cluster_ca_certificate
  }
}

resource "helm_release" "nginx-ingress" {
  name = var.environment
  repository = "https://helm.nginx.com/stable"
  chart = "nginx-ingress"

  set {
    name = "controller.service.loadBalancerIP"
    value = var.load_balancer_ip
  }

  set {
    name = "rbac.create"
    value = true
  }

  set {
    name = "controller.publishService.enabled"
    value = true
  }

  set {
    name = "controller.service.omitClusterIP"
    value = "true"
  }

  set {
    name = "defaultBackend.service.omitClusterIP"
    value = "true"
  }

}