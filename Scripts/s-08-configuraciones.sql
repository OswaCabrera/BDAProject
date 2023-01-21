connect sys/gaca123# as sysdba

-- startup mount 

-- alter database archivelog;

-- alter database 
--   add logfile member '/unam-bda/d10/app/oracle/oradata/GACAPROY/redo01a.log' to group 1;

-- alter database 
--   add logfile member '/unam-bda/d11/app/oracle/oradata/GACAPROY/redo01b.log' to group 1;
  
-- alter database 
--   add logfile member '/unam-bda/d10/app/oracle/oradata/GACAPROY/redo02a.log' to group 2;

-- alter database 
--   add logfile member '/unam-bda/d11/app/oracle/oradata/GACAPROY/redo02b.log' to group 2;
 
-- alter database 
--   add logfile member '/unam-bda/d10/app/oracle/oradata/GACAPROY/redo03a.log' to group 3;

-- alter database 
--   add logfile member '/unam-bda/d11/app/oracle/oradata/GACAPROY/redo03b.log' to group 3;
 
configure retention policy to recovery window of 7 days;

configure controlfile autobackup format for device type disk clear;

--Necesario?
configure archivelog deletion policy backed up 2 times tp disk;

configure backup optimization on;
