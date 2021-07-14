#!/bin/bash

sudo mkdir -p /var/moscodb
sudo chown -R  27:27 /var/moscodb
sudo semanage fcontext -a -t container_file_t '/var/moscodb(/.*)?'
sudo restorecon -Rv /var/moscodb
ls -ldZ /var/moscodb

# Creamos un directorio donde vamos a persistir informacion
#sudo mkdir -p /var/dbmysql

# En el caso de MySQL tomado del repositorio de Red Hat el contenedor corre con el UID 27.
#sudo chown -R 27:27 /var/dbmysql

# Aplicamos el contexto de SELinux al directorio
#sudo semanage fcontext -a -t container_file_t '/var/dbmysql(/.*)?'

# Aplicamos SELinux policy
#sudo restorecon -Rv /var/dbmysql

# Chequemos los permisos.
#ls -dZ /var/dbmysql



anda
 1118  sudo mkdir -pv /var/local/mysql
 1119  sudo semanage fcontext -a -t container_file_t '/var/local/mysql(/.*)?'
 1120  sudo restorecon -R /var/local/mysql
 1121  ls -ldZ /var/local/mysql
 1122  sudo chown -Rv 27:27 /var/local/mysql


 [sebastianmascolo@bluebox borrar]$ sudo mkdir -p /var/pepe
[sebastianmascolo@bluebox borrar]$ sudo semanage fcontext -a -t container_file_t '/var/pepe(/.*)?'
[sebastianmascolo@bluebox borrar]$ sudo restorecon -R /var/pepe
[sebastianmascolo@bluebox borrar]$ sudo chown -R 27:27 /var/pepe

