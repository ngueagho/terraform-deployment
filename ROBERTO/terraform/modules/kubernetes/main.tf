resource "kubernetes_deployment" "react" {
  metadata {
    name = var.name
    namespace = var.namespace
    labels = var.labels 
  }
  spec {
    template {
      metadata {
        labels = var.labels 
      }
      spec {
        container {
          name = var.container-name
          image = var.container-image
        }
        node_name = "master"
        
      }
      
    }
    strategy {
        type = "Recreate"
    }
    selector {
      match_labels = {
        id="king"
      }
    }
    replicas = 3
  }
}