#!/bin/bash

echo "Desde un archivo "
curl http://localhost:20080/index2.html
echo "Desde un argumento "
curl http://localhost:20080/index.html
echo "Echo de la variable de entorno "
sudo podman exec -ti do180-p1c /bin/bash -c 'echo $ENTORNO'

