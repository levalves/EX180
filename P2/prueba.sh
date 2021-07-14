#!/bin/bash

mysql -uuser1 -pmypa55 -h 127.0.0.1 -P13306
sudo podman exec -ti do180-p21 /opt/rh/rh-mysql57/root/usr/bin/mysql -uroot do180 -e "show tables"

firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload
