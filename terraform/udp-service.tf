resource "kubernetes_service" "udp-service" {
  metadata {
    name = "udp-service"
  }
  spec {
    selector = {
      app = kubernetes_deployment.udp_deployment.metadata.0.labels.app
    }
    port {
      name        = "udp-port"
      port        = 7778
      target_port = 7778
      protocol    = "UDP"

    }

    type = "ClusterIP"
  }
}