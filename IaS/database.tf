resource "docker_image" "bd" {
  name         = "postgres:16-alpine"
  keep_locally = true
}

resource "docker_volume" "bd" {
  name = "vol-bd-${local.env}"
}