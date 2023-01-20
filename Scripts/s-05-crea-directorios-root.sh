#!/bin/bash
#@Autor: Edgar García
#@Fecha: /09/2022
#@Descripción: Script que crea los directorios necesarios para
#la instrucción create database

echo "Creando directorios para data files"
export ORACLE_SID=gacaproy
cd /u01/app/oracle/oradata
mkdir ${ORACLE_SID^^}
chown oracle:oinstall ${ORACLE_SID^^}
chmod 750 ${ORACLE_SID^^}



echo "Creando directorios para data files"

cd /u01/app/oracle/oradata/GACAPROY
mkdir -p default
mkdir -p media
mkdir -p vendors01
mkdir -p vendors02
mkdir -p vendors03
mkdir -p services01
mkdir -p services02
mkdir -p services03
mkdir -p clients01
mkdir -p clients02
mkdir -p clients03
mkdir -p bankData/clients01
mkdir -p bankData/clients02
mkdir -p bankData/clients03
mkdir -p bankData/vendors01
mkdir -p bankData/vendors02
mkdir -p bankData/vendors03
mkdir -p indexes01
mkdir -p indexes02
mkdir -p indexes03
chown oracle:oinstall *
chmod 750 * bankData/*

echo "Creando directorios para Redologs"

cd /unam-bda/d10
mkdir -p app/oracle/oradata/GACAPROY
chown -R oracle:oinstall app
chmod -R 750 app



cd /unam-bda/d11
mkdir -p app/oracle/oradata/GACAPROY
chown -R oracle:oinstall app
chmod -R 750 app

cd /unam-bda/d12
mkdir -p app/oracle/oradata/GACAPROY
chown -R oracle:oinstall app
chmod -R 750 app


cd /unam-bda/archivelogs/
mkdir -p GACAPROY/disk_b
chown -R oracle:oinstall app
chmod -R 750 app

echo "Mostrando directorio de data files"
ls -l /u01/app/oracle/oradata/GACAPROY
echo "Mostrando directorios para control files y Redo Logs"
ls -l /unam-bda/d0*/app/oracle/oradata