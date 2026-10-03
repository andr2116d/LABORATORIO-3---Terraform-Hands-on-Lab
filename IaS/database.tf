resource "docker_image" "bd" {
  name         = "postgres:16-alpine"
  keep_locally = true
}