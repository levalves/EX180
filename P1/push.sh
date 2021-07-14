#!/bin/bash

sudo podman tag do180-p1 docker.io/sebastianmascolo/do180-p1
sudo podman login -u sebastianmascolo docker.io
sudo podman push docker.io/sebastianmascolo/do180-p1
sudo podman save -o imagen-local.tar localhost/do180-p1

