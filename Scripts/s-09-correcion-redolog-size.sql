conn sys/gaca123# as sysdba

alter database mount 

-- alter database
-- add logfile
-- group 4 size 150m;

-- alter database
-- add logfile
-- group 5 size 150m;

-- alter database
-- add logfile
-- group 6 size 150m;

alter database 
  add logfile member '/unam-bda/d10/app/oracle/oradata/GACAPROY/redo01a.log' to group 4;

alter database 
  add logfile member '/unam-bda/d11/app/oracle/oradata/GACAPROY/redo01b.log' to group 4;
  
alter database 
  add logfile member '/unam-bda/d10/app/oracle/oradata/GACAPROY/redo02a.log' to group 5;

alter database 
  add logfile member '/unam-bda/d11/app/oracle/oradata/GACAPROY/redo02b.log' to group 5;
 
alter database 
  add logfile member '/unam-bda/d10/app/oracle/oradata/GACAPROY/redo03a.log' to group 6;

alter database 
  add logfile member '/unam-bda/d11/app/oracle/oradata/GACAPROY/redo03b.log' to group 6;

