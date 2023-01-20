--@Autor: Oswaldo Cabrera Pérez
--      Edgar Cristobal
--@Fecha creación: 21/12/2022
--@Descripción: Creacion del diccionario de datos

Prompt conectando como usuario sys
connect sys/gaca123# as sysdba


@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

disconnect 

connect system/gaca123#

@?/sqlplus/admin/pupbld.sql