resource "kubernetes_ingress" "nginx_ingress" {
  metadata {
    name = "ingress"
    annotations = {
      "kubernetes.io/ingress.class": "nginx"
    }
  }
  spec {
    rule {
      host = var.base_domain
      http {
        path {
          path = "/"
          backend {
            service_name = "service-${local.demo_api_name}"
            service_port = "80"
          }
        }
      }
    }
//    rule {
//      host = "echo-server-${var.base_domain}"
//      http {
//        path {
//          path = "/"
//          backend {
//            service_name = "service-${local.echo_server_name}"
//            service_port = "80"
//          }
//        }
//      }
//    }
  }
}