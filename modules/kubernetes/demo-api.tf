resource "kubernetes_deployment" "demo_api" {
  metadata {
    name = "deployment-${local.demo_api_name}"
  }

  spec {
    replicas = var.demo_api.replicas

    selector {
      match_labels = {
        app = local.demo_api_name
      }
    }

    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge = "25%"
        max_unavailable = 0
      }
    }

    template {
      metadata {
        labels = {
          app = local.demo_api_name
        }
      }
      spec {
        container {
          name  = local.demo_api_name
          image = local.demo_api_image

          resources {
            limits {
              cpu    = "25m"
            }
            requests {
              cpu    = "25m"
            }
          }

          env {
            name = "APP_ENV"
            value = var.environment
          }

          liveness_probe {
            http_get {
              path = "/healthcheck"
              port = 3000
            }
            initial_delay_seconds = 1
            period_seconds = 10
          }

          readiness_probe {
            http_get {
              path = "/healthcheck"
              port = 3000
            }
            initial_delay_seconds = 1
            period_seconds = 10
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "demo_api" {
  metadata {
    name = "service-${local.demo_api_name}"
  }
  spec {
    selector = {
      app = local.demo_api_name
    }
    port {
      port = 80
      target_port = 3000
    }
  }
}