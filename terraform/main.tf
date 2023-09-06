# Définition du fournisseur Kubernetes

terraform {
  required_providers {
    kubernetes = {
      source = "kubernetes"
    }
  }
  backend "kubernetes" {
    config_path   = "~/.kube/config"
    secret_suffix = "react"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

# Création de la ressource Docker image à partir du Dockerfile existant

resource "docker_image" "my_react_app" {
  name          = "my-react-app"
  build         = {
    context    = "${path.module}/react-app"  # Chemin vers le répertoire contenant votre projet React
    dockerfile = "./../Dockerfile"  # Chemin vers votre fichier Dockerfile existant
  }
  keep_locally  = false
}

# Création du déploiement Kubernetes


resource "kubernetes_deployment" "my_react_app_deployment" {
  metadata {
    name = "my-react-app-deployment"
  }

  spec {
    selector {
      match_labels = {
        app = "my-react-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "my-react-app"
        }
      }

      spec {
        container {
          name  = "my-react-app-container"
          image = docker_image.my_react_app.latest

          # Options facultatives pour personnaliser le conteneur
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
