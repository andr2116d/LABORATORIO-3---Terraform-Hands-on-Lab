resource "docker_image" "api" {
  name         = "nmatsui/hello-world-api:latest"
  keep_locally = true
}


