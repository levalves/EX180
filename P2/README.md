# Server MYSQL

# ENGLISH

### Dockerfile
Make a Dockerfile with a mysql image  
1) Use the image rhscl/mysql-57-rhel7  
2) Copy http://legacy.redhat.com/pub/redhat/linux/9/en/doc/RH-DOCS/pdf-en/rhl-gsg-es.pdf to /opt/app-root/src  
3) The container uses the next environments variables MYSQL_USER=user1,MYSQL_PASSWORD=mypa55,MYSQL_DATABASE=do180,MYSQL_ROOT_PASSWORD=r00tpa55  
4) PORTFORWARD of port from host 13306 to 3306, use a enviromnet var called PORT 3306 to expose the port in the  Dockerfile  
5) Save the data of container dir /var/lib/mysql/data to host /var/local/mysql  
6) Copy the file mysql/do180.sql to /opt/app-root/src  
7) This container runs as a service  

### Scripts  
Create some files called  build.sh, start.sh, stop.sh, dump.sh, logs.sh.
1) Create a script called  build.sh that make a build with the name of image do180-p2, Variable of build NOMBRE with your name, the list the images
2) Create a script called  start.sh start a container called do180-p2c and expose port 13306:3306 with enviornments vars of item 3  
3) Create a script called  dump.sh to copy the db do180 from  mysql/dump.sql into the container.  
4) Create a script called  stop.sh to stop all containers, and remove all containers.  
5) Create a script called  logs.sh to get the last  20 logs  
6) Create a script called  tags.sh tag the image and upload to quay.io, then download the image from quay.io and save it to  do180-p2.tar  
7) Make a diff


# SPANISH

### Dockerfile  
Hacer un dockerfile para levantar un servicio mysql
1) Usar la siguiente imagen rhscl/mysql-57-rhel7
2) Copiar http://legacy.redhat.com/pub/redhat/linux/9/en/doc/RH-DOCS/pdf-en/rhl-gsg-es.pdf a /opt/app-root/src
3) Ejecutar el contenedor con las siguientes variables de entorno MYSQL_USER=user1,MYSQL_PASSWORD=mypa55,MYSQL_DATABASE=do180,MYSQL_ROOT_PASSWORD=r00tpa55
4) PORTFORWARD del port de host 13306 a 3306 del contenedor, usar la variable de entorno PORT 3306 para exponer el puerto en el Dockerfile
5) Crear un volumen en el contendor de la carpeta DB para salvar la base de datos en /var/lib/mysql/data
6) Copiar el archivo mysql/do180.sql a /opt/app-root/src
7) Corre como servicio

### Scripts  
Crear scripts de build, start, stop, dump, logs.
1) Crear un script llamado build.sh para hacer el build con Nombre de la imagen do180-p2, Variable de build NOMBRE ingresar su nombre, luego mostrar la imagen creada
2) Crear un script llamado start.sh para que inicie un contenedor llamado do180-p2c y exponga el puerto 13306:3306 y le pases la variable de enorno del punto 3 de Dockerfile
3) Crear un script llamado dump.sh para copiar la db do180 en mysql/dump.sql al contenedor, verificar que se crearon las tablas correctamente.
4) Crear un script llamado stop.sh para stopear el contenedor y eliminar el contenedor
5) Crear un script llamado logs.sh para obtener los ultimos 20 logs
6) Crear un script llamado tags.sh para tagear la imagen y subirla a quay.io tambien bajar la imagen y salvarla a do180-p2.tar
7) Hacer un  diff y ver las modificaciones con respecto a la imagen FROM, ademas hacer un touch foo.txt y luego commitear el contenedor a una  imagen llamada do180-p2-tuned

