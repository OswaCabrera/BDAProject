--@Autor: Oswaldo Cabrera Pérez
--      Edgar Cristobal
--@Fecha creación: 21/12/2022
--@Descripción: Creacion del diccionario de datos

Prompt conectando como usuario sys
connect sys/system3 as sysdba


@?/rdbms/admin/catalog.sql
@?/rdbms/admin/catproc.sql
@?/rdbms/admin/utlrp.sql

disconnect 

connect system/system3

@?/sqlplus/admin/pupbld.sql