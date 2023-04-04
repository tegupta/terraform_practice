provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Download the latest Centos image
resource "docker_image" "myimg" {
  name = var.myimg
}

resource "docker_container" "mycontainer" {
  name  = "testing"
  image = docker_image.myimg.latest
  ports {
    internal = var.intport
    external = var.extport
  }
}

variable "myimg" {
  default = "centos:latest"
}

variable "intport" {
  default = "80"
}

variable "extport" {
  default = "80"
}

