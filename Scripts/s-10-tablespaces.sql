WHENEVER SQLERROR EXIT ROLLBACK;

CREATE SMALLFILE TABLESPACE VENDORS
  datafile '/u01/app/oracle/oradata/GACAPROY/vendors01/vendors01.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/vendors02/vendors02.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/vendors03/vendors03.dbf'size 8M
    autoextend on next 2M maxsize 32M 
  extent management local autoallocate;


CREATE SMALLFILE TABLESPACE SERVICES
  datafile '/u01/app/oracle/oradata/GACAPROY/services01/services01.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/services02/services02.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/services03/services03.dbf'size 8M
    autoextend on next 2M maxsize 32M 
  extent management local autoallocate;


CREATE TABLESPACE CLIENTS
  datafile '/u01/app/oracle/oradata/GACAPROY/clients01/clients01.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/clients02/clients02.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/clients03/clients03.dbf'size 8M
    autoextend on next 2M maxsize 32M 
  extent management local autoallocate;

--creación del wallet.
-- ALTER SYSTEM SET ENCRYPTION KEY IDENTIFIED BY "wallet_password";
-- SHUTDOWN IMMEDIATE
-- STARTUP MOUNT
-- alter system set encryption wallet open identified by "wallet_password";
-- orapki

CREATE TABLESPACE CLIENT_BANK_DATA
  datafile '/u01/app/oracle/oradata/GACAPROY/bankData/clients01/clients01.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/bankData/clients02/clients02.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/bankData/clients03/clients03.dbf'size 8M
    autoextend on next 2M maxsize 32M 
  extent management local autoallocate
  encryption using 'aes256' encrypt;


CREATE TABLESPACE VENDOR_BANK_DATA
  datafile '/u01/app/oracle/oradata/GACAPROY/bankData/vendors01/vendors01.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/bankData/vendors02/vendors02.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/bankData/vendors03/vendors03.dbf'size 8M
    autoextend on next 2M maxsize 32M 
  extent management local autoallocate
  encryption using 'aes256' encrypt;


CREATE TABLESPACE INDEXES 
  datafile '/u01/app/oracle/oradata/GACAPROY/indexes01/indexes01.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/indexes02/indexes02.dbf' size 8M,
           '/u01/app/oracle/oradata/GACAPROY/indexes03/indexes03.dbf'size 8M
  autoextend on next 2M maxsize 32M 
  extent management local autoallocate;

CREATE BIGFILE TABLESPACE MEDIA 
  datafile '/u01/app/oracle/oradata/GACAPROY/media/media.dbf' size 256M
  autoextend on next 16M maxsize 32G 
  extent management local autoallocate;

