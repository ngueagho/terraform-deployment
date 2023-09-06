
# Création du service Kubernetes
resource "kubernetes_service" "my_react_app_service" {
  depends_on = [ kubernetes_deployment.my_react_app_deployment ]
  metadata {
    name = "my-react-app-service"
  }

  spec {
    selector = {
      app = "my-react-app"
    }

    port {
      port        = 80
      target_port = 80
      node_port = 30062
    }

    type = "NodePort" 
  }
}