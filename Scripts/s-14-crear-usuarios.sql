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

grant select insert, update, delete on sys.empresa to client_admin;
grant select, insert, update, delete on sys.persona to client_admin;
grant select, insert, update, delete on sys.tarjeta to client_admin;
grant select, insert, update, delete on sys.pago to client_admin;
grant select, insert, update, delete on sys.cliente to client_admin;

grant select, insert, update, delete on sys.proveedor to vendor_admin;
grant select, insert, update, delete on sys.banco to vendor_admin;
grant select, insert, update, delete on sys.deposito to vendor_admin;
grant select, insert, update, delete on sys.nivel_estudio to vendor_admin;
grant select, insert, update, delete on sys.email to vendor_admin;
grant select, insert, update, delete on sys.imagen to vendor_admin;
grant select, insert, update, delete on sys.evidencia_servicio to vendor_admin;
grant select, insert, update, delete on sys.estatus_proveedor to vendor_admin;
grant select, insert, update, delete on sys.proveedor_tipo_servicio to vendor_admin;
grant select, insert, update, delete on sys.comprobante_experiencia to vendor_admin;
grant select, insert, update, delete on sys.entidad_federativa to vendor_admin;

grant select, insert, update, delete on sys.servicio to service_admin;
grant select, insert, update, delete on sys.tipo_servicio to service_admin;
grant select, insert, update, delete on sys.estatus_servicio to service_admin;
grant select, insert, update, delete on sys.historico_estatus_servicio to service_admin;
grant select, insert, update, delete on sys.calificacion to service_admin;

grant select, insert, update, delete on sys.cuenta_bancaria to bank_admin;
grant select, insert, update, delete on sys.banco to bank_admin;
grant select, insert, update, delete on sys.tarjeta to bank_admin;

grant select, insert, update, delete on sys.imagen to media_admin;
grant select, insert, update, delete on sys.cuenta_bancaria to bank_admin;


