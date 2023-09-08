/* resource "local_exec" "docker-build" {
  command = "docker build -t terra ./../Dockerfile"
} */

terraform {
  required_providers {
    docker = {
      /* source  = "terraform-providers/docker" */

      source = "kreuzwerker/docker"
      version = ">= 2.13.0"
      # chemin d'accès au binaire du fournisseur Docker téléchargé
      /* paths   = ["path/to/terraform-provider-docker"] */
    }
  }
}

provider "docker" {
  # Configuration du fournisseur Docker
  host = "unix:///var/run/docker.sock"
}

# Define the Docker image build and push
resource "docker_image" "example" {
  name          = "robertolandry/your-image-name:latest"
  build {
    context    = "./../../"
    dockerfile = "./../../Dockerfile"
  }
  push {
    name          = "robertolandry/your-image-name:latest"
    registry_auth = "dockerhub"
  }
}

# Define the Docker registry authentication
resource "docker_registry_auth" "dockerhub" {
  serveraddress = "https://index.docker.io/v1/"
  username      = "robertolandry"
  password      = "kjfbdfkgfk23902"
  email         = "ngueaghotiodongrobertolandry@gmail.com"
}
