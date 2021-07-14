#!/bin/bash

echo "Verifico que no existan tablas nuevas"
mysql -uuser1 -pmypa55 -h 127.0.0.1 -P13306 do180 -e "show tables"

echo "Impacto el dump"
mysql -uuser1 -pmypa55 -h 127.0.0.1 -P13306 do180 < mysql/do180.sql 

echo "Verifico que existan tablas nuevas"
mysql -uuser1 -pmypa55 -h 127.0.0.1 -P13306 do180 -e "show tables"

