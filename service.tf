
# Création du service Kubernetes
resource "kubernetes_service" "my_react_app_service" {
  depends_on = [kubernetes_deployment.react_deployment]
  metadata {
    name      = "my-react-app-service"
    namespace = "cherif"
  }

  spec {
    selector = {
      app = "my-react-app"
    }

    port {
      port        = 80
      target_port = 80
      node_port   = 30062
    }

    type = "NodePort"
  }
}