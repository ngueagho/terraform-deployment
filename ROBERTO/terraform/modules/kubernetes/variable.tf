variable "name" {
type = string
default = "react-deployment"
}

variable "namespace" {
  type = string
  default = "roberto"
}


variable "labels" {
  type = object({
    username = string
    id=string
  })
  default = {
    username = "roberto"
    id = "king"
  }
}
variable "container-name" {
  type = string
  default = "react-container"
}
variable "container-image" {
  type = string
  default = "robertolandry/terra"
}