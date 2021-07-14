#!/bin/bash

# Elimino imagenes
sudo podman images
sudo podman rm "image"
sudo podman rmi -a

# Buildeo la imagen custom
sudo podman build -t do180-p2 .

# Levanto un contenedor con port random y solo acepta conexiones desde 127.0.0.1
sudo podman run -d  --name do180-p2c  -v /var/moscodb:/var/lib/mysql/data -p 127.0.0.1::3306 -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 -e MYSQL_DATABASE=do180 -e MYSQL_ROOT_PASSWORD=r00tpa5 do180-p2

# Veo en que puerto del host levanto
sudo podman ps 
sudo podman inspect do180-p2c --format "{{.HostConfig.PortBindings}}"


# Transferir archivos a y desde un pod
sudo podman cp standalone.conf myapp:/opt/jboss/standalone/conf/standalone.conf
sudo podman exec -i <container> mysql -uroot -proot < /path/on/host/db.sql < db.sql

