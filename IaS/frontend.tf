resource "docker_image" "web" {
  name         = "nginx:alpine"
  keep_locally = true
}