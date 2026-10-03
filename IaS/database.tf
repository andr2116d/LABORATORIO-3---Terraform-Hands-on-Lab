resource "docker_image" "bd" {
  name         = "postgres:16-alpine"
  keep_locally = true
}

resource "docker_volume" "bd" {
  name = "vol-bd-${local.env}"
}

resource "docker_container" "bd" {
  name    = local.nombre.bd
  image   = docker_image.bd.image_id
  restart = "unless-stopped"

  env = [
    "POSTGRES_USER=admin",
    "POSTGRES_PASSWORD=admin123",
    "POSTGRES_DB=appdb",
  ]

  ports {
    internal = 5432
    external = local.puerto.bd
  }

  volumes {
    volume_name    = docker_volume.bd.name
    container_path = "/var/lib/postgresql/data"
  }

  networks_advanced {
    name = docker_network.back.name
  }
}
