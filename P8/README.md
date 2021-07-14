# 8.02 similar a 8.05  
0 lab troubleshoot-s2i start &&  source /usr/local/etc/ocp4.config  
1 Fork del repo, clone clocal y crear un branch nuevo troubleshoot-s2i y crear un proyecto llamado ${RHT_OCP4_DEV_USER}-nodejs  
2 Crear una app llamada nodejs s2i con imagen nodejs version 12, el fuente esta en la carpeta nodejs-helloworld  y con la variable de build npm_config_registry=http://${RHT_OCP4_NEXUS_SERVER}/repository/npm-proxy  
3 Ver si buildea  
4 Ayuda "scripts": { "start": "node app.js" }  

# SOLUCION

```

git checkout -b troubleshoot-s2i2
git push
git push --set-upstream origin troubleshoot-s2i2

oc new-app --as-deployment-config --name nodejs  https://github.com/${RHT_OCP4_GITHUB_USER}/DO180-apps#troubleshoot-s2i  -i nodejs:12 --context-dir=nodejs-helloworld` --build-env  npm_config_registry=http://${RHT_OCP4_NEXUS_SERVER}/repository/npm-proxy

oc logs bc/nodejs -f
Falla No matching version found
arreglar
git add, commit push
oc start-build nodejs
oc logs bc/nodejs -f
Ahora buildeo bien pero 

oc logs dc/nodejs -f dice missing script start
npm ERR! missing script: start
fix y luego git add commit push
oc start-build nodjs
oc logs dc/nodejs -f
oc expose svc/nodejs
curl ruta ok
```



# 8.04 Hace un podman log 

Briefly review the custom httpd.conf file located at /home/student/DO180/labs/troubleshoot-container/conf/httpd.conf

# SOLUCION

```

[student@workstation ~]$ cd ~/DO180/labs/troubleshoot-container
[student@workstation troubleshoot-container]$ sudo podman build \
>  -t troubleshoot-container .

[student@workstation ~]$ sudo podman run \
> --name troubleshoot-container -d \
> -p 10080:80 troubleshoot-container

[student@workstation ~]$ sudo podman logs -f troubleshoot-container
... [mpm_event:notice] [pid 1:tid...] AH00489: Apache/2.4.37 ...
... [mpm_event:info] [pid 1:tid...] AH00490: Server built: Apr  5 2019 07:31:21
... [core:notice] [pid 1:tid...] AH00094: Command line: 'httpd -D FOREGROUND'
... [core:debug] [pid 1:tid ...): AH02639: Using SO_REUSEPORT: yes (1)
... [mpm_event:debug] [pid 6:tid ...): AH02471: start_threads: Using epoll
... [mpm_event:debug] [pid 7:tid ...): AH02471: start_threads: Using epoll
... [mpm_event:debug] [pid 8:tid ...): AH02471: start_threads: Using epoll
```







# 8.05
0 lab troubleshoot-review start  && source /usr/local/etc/ocp4.config  
1 Fork del repo, clone clocal y crear un branch nuevo  troubleshoot-review en DO180-apps  
2 Crear un proyecto llamado ${RHT_OCP4_DEV_USER}-nodejs-app, una app llamada nodejs-dev s2i con imagen nodejs version 12, el fuente esta en nodejs-app y con la variable de build npm_config_registry=http://${RHT_OCP4_NEXUS_SERVER}/repository/npm-proxy  
3 Ver si buildea  
4 Arreglar el codigo, pushear y buildear denuevo
5 Ver logs
6 Exponer ruta
7 curl nodejs-dev-${RHT_OCP4_DEV_USER}-nodejs-app.${RHT_OCP4_WILDCARD_DOMAIN}  
8 lab troubleshoot-review finish  


# SOLUCION
```
[student@workstation ~]$ oc new-app --as-deployment-config --name nodejs-dev \
> https://github.com/${RHT_OCP4_GITHUB_USER}/DO180-apps#troubleshoot-review \
> -i nodejs:12 --context-dir=nodejs-app --build-env \
> npm_config_registry=http://${RHT_OCP4_NEXUS_SERVER}/repository/npm-proxy

[student@workstation ~]$ oc logs -f bc/nodejs-dev
Cloning "https://github.com/yourgituser/DO180-apps" ...
...output omitted...
STEP 8: RUN /usr/libexec/s2i/assemble
---> Installing application source ...
---> Installing all dependencies
npm ERR! code ETARGET
npm ERR! notarget No matching version found for express@4.20.
npm ERR! notarget In most cases you or one of your dependencies are requesting
npm ERR! notarget a package version that doesn't exist.
npm ERR! notarget
npm ERR! notarget It was specified as a dependency of 'src'
npm ERR! notarget


[student@workstation nodejs-app]$ cat package.json
{
  "name": "nodejs-app",
  "version": "1.0.0",
  "description": "Hello World App",
  "main": "server.js",
  "author": "Red Hat Training",
  "license": "ASL",
  "dependencies": {
    "express": "4.x",
    "html-errors": "latest"
  }
}

[student@workstation nodejs-app]$ git commit -am "Fixed Express release"
...output omitted...
 1 file changed, 1 insertion(+), 1 deletion(-)
[student@workstation nodejs-app]$ git push
...output omitted...
To https://github.com/yourgituser/DO180-apps/
   ef6557d..73a82cd  troubleshoot-review -> troubleshoot-review

oc start-build bc/nodejs-adev
oc expose svc/nodejs-dev

[student@workstation nodejs-app]$ oc start-build bc/nodejs-dev



Luego no deploya bien porque tenia mal en server.js
app.get('/', function (req, res) {
  res.send('Hello World from pod: ' + process.environment.HOSTNAME + '\n')
});

Cambiar a env y luego start-build
```
