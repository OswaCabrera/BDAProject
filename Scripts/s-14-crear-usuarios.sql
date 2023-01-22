--@Autor: Oswaldo Cabrera Pérez
--@Fecha creación: 25/09/2022
--@Descripción: Creacion de usuarios


whenever sqlerror exit rollback;

-- para propósitos de pruebas y propósitos académicos se incluye el password
-- no hacer esto en sistemas reales.
disconnect

Prompt conectando como usuario sys
connect sys/gaca123# as sysdba

-- create user vendor_admin identified by gaca123 quota unlimited on vendors
--   default tablespace vendors;
-- grant create session, create table, create procedure, create view,
--   create synonym, create sequence to vendor_admin;

-- create user client_admin identified by
-- gaca123 quota unlimited on clients
--   default tablespace clients;
-- grant create session, create table, create procedure, create view,
--   create synonym, create sequence to client_admin;

-- create user service_admin
--  identified  by gaca123 quota unlimited on services
--   default tablespace services;
-- grant create session, create table, create procedure, create view,
--   create synonym, create sequence to service_admin;



create user bank_admin
 identified by gaca123 quota unlimited on vendor_bank_data
  default tablespace vendor_bank_data;
grant create session, create table, create procedure, create view,
  create synonym, create sequence to bank_admin;

create user media_admin  identified by gaca123 quota unlimited on media
  default tablespace media;
grant create session, create table, create procedure, create view,
  create synonym, create sequence to media_admin;
