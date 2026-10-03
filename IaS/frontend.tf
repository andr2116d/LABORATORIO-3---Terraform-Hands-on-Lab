resource "docker_image" "web" {
  name         = "nginx:alpine"
  keep_locally = true
}

resource "docker_container" "web" {
  name    = local.nombre.web
  image   = docker_image.web.image_id
  restart = "unless-stopped"

  upload {
    file    = "/etc/nginx/conf.d/default.conf"
    content = <<-EOT
      server {
          listen 80;

          location / {
              root  /usr/share/nginx/html;
              index index.html;
          }

          location /api/ {
              proxy_pass http://api:3000/;
          }
      }
    EOT
  }

  ports {
    internal = 80
    external = local.puerto.web
  }

  networks_advanced {
    name = docker_network.front.name
  }

  depends_on = [docker_container.api]
}
