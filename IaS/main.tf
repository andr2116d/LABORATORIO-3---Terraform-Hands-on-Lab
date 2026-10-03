terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.6.0"
    }
  }
}

provider "docker" {
  # Configuration options
}

locals {
  env = terraform.workspace

  nombres = {
    dev = {
      web = "web-dev"
      api = "api-dev"
      bd  = "bd-dev"
    }
    qa = {
      web = "web-qa"
      api = "api-qa"
      bd  = "bd-qa"
    }
  }

  nombre = local.nombres[local.env]
  puerto = var.puertos[local.env]
}
