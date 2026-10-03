resource "docker_network" "front" {
  name = "red-front-${local.env}"

  lifecycle {
    precondition {
      condition     = contains(var.workspaces, terraform.workspace)
      error_message = "No se encuentra el workspace."
    }
  }
}

resource "docker_network" "back" {
  name = "red-back-${local.env}"
}
