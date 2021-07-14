# 7.02 Este es con podman, hace varios build y usa 2 contenedores una db y un node.  

Hacer lab multicontainer-design start y luego y a /home/student/DO180/labs/multicontainer-design/images/mysql/ y hacer un build con el nombre do180/mysql-57-rhel7  
Verificar la creacion de la imagen  
Hacer un build de /home/student/DO180/labs/multicontainer-design/images/nodejs/ con el nombre do180/nodejs  
Hacer un build /home/student/DO180/labs/multicontainer-design/deploy/nodejs/build.sh  
Editar el /home/student/DO180/labs/multicontainer-design/deploy/nodejs/networked/run.sh agregando un podman run con la variables:  
  
Para DB:  
Corre como servicio
name mysql  
MYSQL_DATABASE=items  
MYSQL_USER=user1  
MYSQL_PASSWORD=mypa55  
MYSQL_ROOT_PASSWORD=r00tpa55  
Volumen $PWD/work/data:/var/lib/mysql/data  
Volumen $PWD/work/init:/var/lib/mysql/init  
Puerto  30306 3306   
Ip 10.88.100.101  
Imagen do180/mysql-57-rhel7  
 
Para NODE:  
Corre como servicio
name todoapi  
MYSQL_DATABASE=items  
MYSQL_USER=user1  
MYSQL_PASSWORD=mypa55  
Port  30080:30080  
Imagen do180/todonodejs  


Hacer un curl -w "\n"  http://127.0.0.1:30080/todo/api/items/1  
lab multicontainer-design finish

# SOLUCION

1 Hacer un lab multicontainer-design start:
Hacer un build de  /home/student/DO180/labs/multicontainer-design/images/mysql/Dockerfile
sudo podman build -t do180/mysql-57-rhel7 --layers=false .
sudo podman images
2 Hacer un build de  /home/student/DO180/labs/multicontainer-design/images/nodejs/Dockerfile
sudo podman build -t do180/nodejs --layers=false .
Este Dockerfiles tiene un ENV HOME=/opt/app-root/src que luego usa en WORKDIR ${HOME}
3 Hacer un build del child image /home/student/DO180/labs/multicontainer-design/deploy/nodejs/build.sh 
basicamente tiene un sudo podman build -t do180/todonodejs --build-arg NEXUS_BASE_URL=ALGO .

Dockerfile
FROM do180/nodejs
ARG NEXUS_BASE_URL
MAINTAINER username <username@example.com>
COPY run.sh build ${HOME}/
RUN scl enable rh-nodejs8 'npm install --registry=http://$NEXUS_BASE_URL/repository/nodejs/'

4

```
4.1 Edit the run.sh file located at /home/student/DO180/labs/multicontainer-design/deploy/nodejs/networked to insert the podman run command at the appropriate line for invoking mysql container. The following screen shows the exact podman command to insert into the file.

sudo podman run -d --name mysql -e MYSQL_DATABASE=items -e MYSQL_USER=user1 \
-e MYSQL_PASSWORD=mypa55 -e MYSQL_ROOT_PASSWORD=r00tpa55 \
-v ./work/data:/var/lib/mysql/data \
-v ./work/init:/var/lib/mysql/init -p 30306:3306 \
--ip 10.88.100.101 do180/mysql-57-rhel7



4.2) In the same run.sh file, insert another podman run command at the appropriate line to run the todoapi container. The following screen shows the docker command to insert into the file.

sudo podman run -d --name todoapi -e MYSQL_DATABASE=items -e MYSQL_USER=user1 \
-e MYSQL_PASSWORD=mypa55 -p 30080:30080 \
do180/todonodejs




6) Examine the environment variables of the API container.

Run the following command to explore the environment variables exposed in the API container.

[student@workstation networked]$ sudo podman exec -it todoapi env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
TERM=xterm
HOSTNAME=
container=oci
NODEJS_VERSION=8.0
HOME=/opt/app-root/src
MYSQL_DATABASE=items
MYSQL_USER=user1
MYSQL_PASSWORD=mypa55



7.1) Run a curl command to test the REST API for the To Do List application.

[student@workstation networked]$ curl -w "\n" \
> http://127.0.0.1:30080/todo/api/items/1
{"id":1,"description":"Pick up newspaper","done":false}


```




# 7.04 Idem pero con template, reemplaza el script de run.sh con un template

0 lab multicontainer-openshift start && source /usr/local/etc/ocp4.config  
1 Hacer un build de /DO180/labs/multicontainer-openshift/images/mysql con el nombre do180-mysql-57-rhel7  
2 tag and pushit to quay.io  
3 Hacer un build de /DO180/labs/multicontainer-openshift/images/nodejs  con el nombre do180-nodejs  
4 Go to the ~/DO180/labs/multicontainer-openshift/deploy/nodejs directory and run the build.sh command to build the child image.  
5 tag and push it to quay.io do180-todonodejs  
6 Create new project ${RHT_OCP4_DEV_USER}-template    
7 Create new app from template /home/student/DO180/labs/multicontainer-openshift/todo-template.json with param RHT_OCP4_QUAY_USER=${RHT_OCP4_QUAY_USER}  
8 Review deployment  
9 Expose route and Test app  
10 curl ruta /todo/api/items/1  
11 lab multicontainer-openshift finish


# SOLUCION  
```
1 sudo podman build -t do180-mysql-57-rhel7 .
2 sudo podman tag do180-mysql-57-rhel7 quay.io/sebastian_mascolo/do180-mysql-57-rhel7
   sudo podman login -u sebastian_mascolo quay.io;  sudo podman push quay.io/sebastian_mascolo/do180-mysql-57-rhel7
3 sudo podman build -t do180-nodejs .
4 Hacer un build del child image /home/student/DO180/labs/multicontainer-design/deploy/nodejs/build.sh
   basicamente tiene un sudo podman build -t do180/todonodejs --build-arg NEXUS_BASE_URL=ALGO .
5 sudo podman images
   sudo podman tag do180/todonodejs quay.io/sebastian_mascolo/todonodejs
   sudo podman push quay.io/sebastian_mascolo/todonodejs
6 oc new-project mosco-template
7 oc process -f todo-template.json -p RHT_OCP4_QUAY_USER=${RHT_OCP4_QUAY_USER} |oc create -f -
8 oc get pods -w
9 oc expose svc/todoapi  
``

# 7.05 Idem 7.04 buildea contenedores pero con php y luego usa un template para crear los pods en ocp  


