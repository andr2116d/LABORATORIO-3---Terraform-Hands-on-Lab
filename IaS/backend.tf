resource "docker_image" "api" {
  name         = "nmatsui/hello-world-api:latest"
  keep_locally = true
}

resource "docker_container" "api" {
  name    = local.nombre.api
  image   = docker_image.api.image_id
  restart = "unless-stopped"

  env = [
    "PORT=3000",
    "MESSAGE=hello world desde ${upper(local.env)}",
  ]

  ports {
    internal = 3000
    external = local.puerto.api
  }

  networks_advanced {
    name    = docker_network.front.name
    aliases = ["api"]
  }
  networks_advanced {
    name = docker_network.back.name
  }

  depends_on = [docker_container.bd]
}

