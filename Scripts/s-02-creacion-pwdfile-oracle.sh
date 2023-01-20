#!/bin/bash

#--@Autor: Oswaldo Cabrera Pérez
#          Edgar García
#--@Fecha creación: 21/2/2022
#--@Descripción: Creación del archivo de contraseñas

export ORACLE_SID="gacaproy"

echo "==> Creando a un nuevo archivo"

orapwd FILE='${ORACLE_HOME}/dbs/orapw${ORACLE_SID}' \
  FORMAT=12.2 \
  FORCE=Y \
  SYS=password