--@Autor: Oswaldo Cabrera Pérez
--@Fecha creación: 10/09/2022
--@Descripción: Creacion de la base de datos

Prompt conectando como usuario sys
connect sys/gaca123# as sysdba



whenever sqlerror exit rollback

create database gacaproy
  user sys identified by gacaproy123#
  user system identified by gacaproy123#
  logfile group 1 size 512m blocksize 512,
  group 2 size 512m blocksize 512,
  group 3 size 512m blocksize 512
  maxloghistory 1
  maxlogfiles 16
  maxlogmembers 3
  maxdatafiles 1024
  character set AL32UTF8
  national character set AL16UTF16
  extent management local
  datafile '/u01/app/oracle/oradata/GACAPROY/default/system01.dbf'
  size 700m reuse autoextend on next 10240k maxsize
unlimited
  sysaux datafile
'/u01/app/oracle/oradata/GACAPROY/default/sysaux01.dbf'
    size 550m reuse autoextend on next 10240k maxsize
unlimited
  default tablespace users
    datafile '/u01/app/oracle/oradata/GACAPROY/default/users01.dbf'
    size 1024m reuse autoextend on maxsize unlimited
  default temporary tablespace tempts1
    tempfile '/u01/app/oracle/oradata/GACAPROY/default/temp01.dbf'
    size 200m reuse autoextend on next 640k maxsize unlimited
  undo tablespace undotbs1
    datafile '/u01/app/oracle/oradata/GACAPROY/default/undotbs01.dbf'
    size 512m reuse autoextend on next 5120k maxsize unlimited;
