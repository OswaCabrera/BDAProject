--@Autor: Oswaldo Cabrera Pérez
--@Fecha creación: 25/09/2022
--@Descripción: Creacion del usuario oswaldo0401

--esta instrucción permite detener la ejecución del script al primer error
--útil para detectar errores de forma rápida.
--al final del script se debe invocar a whenever sqlerror continue none
--para regresar a la configuración original.

whenever sqlerror exit rollback;

-- para propósitos de pruebas y propósitos académicos se incluye el password
-- no hacer esto en sistemas reales.
disconnect

Prompt conectando como usuario sys
connect sys/gaca123# as sysdba

-- Prompt Activando pool de Conexiones
-- alter database open;

whenever sqlerror exit rollback;

-- exec dbms_connection_pool.start_pool(); 

-- exec dbms_connection_pool.alter_param ('','MAXSIZE','50');
-- exec dbms_connection_pool.alter_param ('','MINSIZE','30');

-- exec dbms_connection_pool.alter_param ('','INACTIVITY_TIMEOUT','900');
-- exec dbms_connection_pool.alter_param ('','MAX_THINK_TIME','900');

alter system set db_domain='fi.unam' scope=spfile;

alter system set dispatchers='(dispatchers=5)(protocol=tcp)';

alter system set shared_servers=50;

alter system register;