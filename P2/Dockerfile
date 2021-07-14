FROM rhscl/mysql-57-rhel7

ENV PORT=3306

ARG NOMBRE=sinnombre

MAINTAINER mosco mascolo99@gmail.com

#ADD http://legacy.redhat.com/pub/redhat/linux/9/en/doc/RH-DOCS/pdf-en/rhl-gsg-es.pdf  /opt/app-root/src

COPY ./mysql /opt/app-root/src

RUN echo "Hola ${NOMBRE}!!!" > /opt/app-root/src/file.txt 

EXPOSE ${PORT}



