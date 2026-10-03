output "workspace" {
  value = local.env
}

output "contenedores" {
  value = {
    frontend = "${docker_container.web.name}  ${local.puerto.web}:80"
    backend  = "${docker_container.api.name}  ${local.puerto.api}:3000"
    bd       = "${docker_container.bd.name}   ${local.puerto.bd}:5432"
  }
}

output "redes" {
  value = {
    (docker_network.front.name) = [docker_container.web.name, docker_container.api.name]
    (docker_network.back.name)  = [docker_container.api.name, docker_container.bd.name]
  }
}
