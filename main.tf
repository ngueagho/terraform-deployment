# Définition du fournisseur Kubernetes

terraform {
  required_providers {
    kubernetes = {
      source = "kubernetes"
    }

    docker = {

      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
  backend "kubernetes" {
    config_path   = "~/.kube/config"
    secret_suffix = "react"
    namespace     = "cherif"


  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"


}

# Création de la ressource Docker image à partir du Dockerfile existant

resource "docker_image" "my_react_app" {
  name = "my-react-app"
  build {
    # Chemin vers le répertoire contenant votre projet React
    context    = "./Dockerfile"
    dockerfile = "./Dockerfile" # Chemin vers votre fichier Dockerfile existant
  }
  keep_locally = true
}



#configuration du contenair

resource "docker_container" "react" {

  image = docker_image.my_react_app.name
  name  = "react"

  ports {
    internal = 80
    external = 7000
  }

}

# Création du déploiement Kubernetes


resource "kubernetes_deployment" "react_deployment" {
  metadata {
    name = "my-react-app-deployment"

    namespace = "cherif"

    labels = {
      "app" = "my-react-app"

    }

  }

  spec {

    selector {

      match_labels = {
        "app" = "my-react-app"

      }

    }

    template {
      metadata {
        namespace = "cherif"
        labels = {
          "app" = "my-react-app"
        }
      }

      spec {
        container {
          name  = "my-react-app-container"
          image = "cherif1/my-react-app"

          # Options facultatives pour personnaliser le conteneur
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

