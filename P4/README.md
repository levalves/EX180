# P4

## 6-03 New app using a docker image, and using port-forward   
Create a new project that contains your user-mysql-openshift and a app called mysql-openshift  
image in: registry.access.redhat.com/rhscl/mysql-57-rhel7:latest  
env vars used: MYSQL_USER=user1   MYSQL_PASSWORD=mypa55  MYSQL_DATABASE=do180  MYSQL_ROOT_PASSWORD=r00tpa55  
lab openshift-resources start  
source /usr/local/etc/ocp4.config  
Expose route to workstation por 3306   
Test  
oc delete project ${RHT_OCP4_DEV_USER}-mysql-openshift  
lab openshift-resources finish  


## Solution:  
```
1 Login ocp  
lab-configure  
source file generate with lab-configure  
oc login -u user -p http://api.example.com:6443  

2 Create new project name do180-p4-project  
oc new-project do180-p4-project  

3 Create a new app from the rhscl/mysql-57-rhel7 container image.  

This image requires that you use the -e option to set the MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, and MYSQL_ROOT_PASSWORD environment variables. 
Use the --docker-image option with the oc new-app command to specify the classroom private registry URI so that OpenShift does not try and pull the image from the internet:  

oc new-app -e MYSQL_USER=user1  -e MYSQL_PASSWORD=mypa55 -e MYSQL_DATABASE=do180  -e MYSQL_ROOT_PASSWORD=r00tpa55 --name do180-p2 --docker-image=registry.access.redhat.com/rhscl/mysql-57-rhel7:latest  

4 Make a port-forward to localhost and test  

oc port-forward mysql-openshift-1-xg665 3306:3306  (then open another terminal)  

mysql -u user1 -p -h localhost -P3306  
mysql -uuser1 -pmypa55 --protocol tcp -h localhost  

5 Expose route  

oc get svc  

oc expose svc/do180-p2  

oc get routes  

```
