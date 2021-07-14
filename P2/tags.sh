#!/bin/bash


sudo podman tag do180-p2 docker.io/sebastianmascolo/do180-p2
sudo podman login -u sebastianmascolo docker.io
sudo podman push docker.io/sebastianmascolo/do180-p2
sudo podman save -o do180-p2.tar do180-p2
sudo podman load -i do180-p2.tar
sudo podman diff do180-p2

# Commit vs Export vs Save

# Commit de un contenedor a una imagen
#sudo podman commit do180-p2c do180-p2-tuned

# Export guarda un contenedor a un tar
#sudo podman export -o do180-p2-e.tar do180-p2c

# Save guarda la imagen  a un tar
#sudo podman save -o do180-p2.tar do180-p2
