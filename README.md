# Terraform Hands-on Lab

En la siguiente actividad se implementará con Terraform el sigueinte diagrama:

![Diagrama de despliegue en Docker](/img/diagram.png)

**Nota:** No se utilizará un Frontend dedicado, ni un backend dedicado usaremos imagenes ya almacendas en Docker Hub.

## Imagenes Docker a usar

- [Backend - nmatsui/hello-world-api](https://hub.docker.com/r/nmatsui/hello-world-api)
- [Frontend - Nginx](https://hub.docker.com/hardened-images/catalog/dhi/nginx)
- [BD - Postgres:17](https://hub.docker.com/_/postgres)

## Puertos externos a usar

<ol>
        <li>Dev</li>
            <ul>
                <li>Frontend: 80</li>
                <li>Backend: 3000</li>
                <li>Database: 5432</li>
            </ul>
         <li>QA</li>
            <ul>
                <li>Frontend: 80</li>
                <li>Backend: 3000</li>
                <li>Database: 5432</li>
            </ul>
</ol>

## Puertos internos a usar

<ol>
        <li>Dev</li>
            <ul>
                <li>Frontend: 4001</li>
                <li>Backend: 3000</li>
                <li>Database: 4003</li>
            </ul>
         <li>QA</li>
            <ul>
                <li>Frontend: 5001</li>
                <li>Backend: 5002</li>
                <li>Database: 5003</li>
            </ul>
</ol>

## Recursos terraform que da el proveedor de docker que se usaran en el proyecto

- Resource (docker_image)
- Resource (docker_network)
- Resource (docker_container)
- Resource (docker_volume)

**Nota:** Estos recursos y como usarlos se encuentran en [Terraform Registry - docker](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container)


## Despliegue

```bash
cd IaS
terraform init

terraform workspace new dev
terraform apply

terraform workspace new qa
terraform apply

terraform workspace list
```

**Nota** Según dispositovo hay que configurar el host en provider de main.tf

## Destruir

```bash
terraform workspace select dev && terraform destroy 
terraform workspace select qa  && terraform destroy 
```
