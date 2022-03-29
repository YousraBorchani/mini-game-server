resource "kubernetes_deployment" "udp_deployment" {
  metadata {
    name = "udp-deployment"
    labels = {
      app = "udp-server"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "udp-server"
      }
    }

    template {
      metadata {
        labels = {
          app = "udp-server"
        }
      }

      spec {
        container {
          image             = "yosra94/udp_server:1.2"
          name              = "udp-server"
          image_pull_policy = "Always"
          env {
            name  = "SERVER_TTL"
            value = "600"
          }
          resources {
            limits = {
              cpu    = "300m"
              memory = "400Mi"
            }
            requests = {
              cpu    = "150m"
              memory = "200Mi"
            }
          }
          port {
            container_port = 7778
            protocol       = "UDP"
          }

          liveness_probe {
            exec {
              command = ["sh", "-c", "cat /var/run/server-udp.status"]
            }
            initial_delay_seconds = 5
            period_seconds        = 2
          }
          readiness_probe {
            exec {
              command = ["sh", "-c", "cat /var/run/server-udp.status"]
            }
            initial_delay_seconds = 5
            period_seconds        = 2
          }
          startup_probe {
            exec {
              command = ["sh", "-c", "cat /var/run/server-udp.status"]
            }
            initial_delay_seconds = 30
            period_seconds        = 2
          }
        }
      }
    }
  }
}