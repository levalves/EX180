# Server HTTP 
Dockerfile  
Hacer un dockerfile para levantar un servicio httpd  
1) Hacer un yum install de httpd y luego un yum clean all en una sola layer
2) Copiar el index.html en /var/www/html/index2.html  
3) PORTFORWARD del port de host 20080 a 80 del contenedor 
4) Crear una variable build llamada NOMBRE con el valor por default Redhat
5) El dockerfile debe crear un archivo index.html en /var/www/html con el contenido "Hola $NOMBRE!!!"
6) Usar el USER con apache para correrlo
7) Crear una variable de entorno llamada ENTORNO=dafault 
8) Ver entrypoint vs CMD https://stackoverflow.com/questions/21553353/what-is-the-difference-between-cmd-and-entrypoint-in-a-dockerfile  

Scripts  
Crear scripts de build, start, stop, prueba, logs.
1) Crear un script llamado build.sh para hacer el build con Nombre de la imagen do180-p1, Variable de build NOMNBRE ingresar su nombre, luego mostrar la imagen creada
2) Crear un script llamado start.sh para que inicie un contenedor llamado do180-p1c y exponga el puerto 8080:80 y le pases la variable de enorno ENTORNO=desderun
3) Crear un script llamado prueba.sh para hacer un curl de index.html y index2.html al puerto expuesto en el punto 2, haga un echo de la variable de entrorno ENTORNO
4) Crear un script llamado stop.sh para stopear el contenedor y eliminar el contenedor
5) Crear un script llamado logs.sh para obtener los ultimos 20 logs
6) Crear un script para tagear la imagen y subirla a docker.io tambien salvarla a imagen-local.tar

