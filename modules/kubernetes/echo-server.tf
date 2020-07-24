//locals {
//  echo_server_name = "echo-server-${var.environment}"
//}
//
//resource "kubernetes_deployment" "echo_server_name" {
//  metadata {
//    name = "deployment-${local.echo_server_name}"
//  }
//
//  spec {
//    replicas = 1
//
//    selector {
//      match_labels = {
//        app = local.echo_server_name
//      }
//    }
//
//    template {
//      metadata {
//        labels = {
//          app = local.echo_server_name
//        }
//      }
//      spec {
//        container {
//          name  = local.echo_server_name
//          image = "jmalloc/echo-server"
//
//          resources {
//            limits {
//              cpu    = "25m"
//            }
//            requests {
//              cpu    = "25m"
//            }
//          }
//        }
//      }
//    }
//  }
//}
//
//resource "kubernetes_service" "echo_server_name" {
//  metadata {
//    name = "service-${local.echo_server_name}"
//  }
//  spec {
//    selector = {
//      app = local.echo_server_name
//    }
//    port {
//      port = 80
//      target_port = 8080
//    }
//  }
//}