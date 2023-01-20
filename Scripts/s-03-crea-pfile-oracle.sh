#!/bin/bash

#@Autor: Oswaldo Cabrera Pérez
#
#@Fecha creación: 02/09/2022
#@Descripción: Creación de pfile

echo "1. Creando un archivo de parámetros básico"
export ORACLE_SID=gacaproy
pfile=$ORACLE_HOME/dbs/init${ORACLE_SID}.ora
echo  "Este es el pfile ${pfile}"
if [ -f "${pfile}" ]; then
  read -p "El archivo ${pfile} ya existe, [enter] para sobrescribir"
fi

echo \
  "db_name='${ORACLE_SID}'
memory_target=1024M
db_big_table_cache_percent_target=90
control_files=(/unam-bda/d10/app/oracle/oradata/${ORACLE_SID^^}/control01.ctl,
              /unam-bda/d11/app/oracle/oradata/${ORACLE_SID^^}/control02.ctl,
              /unam-bda/d12/app/oracle/oradata/${ORACLE_SID^^}/control03.ctl)
log_archive_max_processes=2
log_archive_format=arch_${ORACLE_SID}_%t_%s_%r.arc
log_archive_min_succeed_dest=1
log_archive_dest_1='LOCATION=USE_DB_RECOVERY_FILE_DEST MANDATORY'
log_archive_dest_2='LOCATION=/unam-bda/archivelogs/GACAPROY/disk_b'
log_archive_trace=1
DB_RECOVERY_FILE_DEST_SIZE=10G
db_recovery_file_dest='/dFRA'
db_flashback_retention_target=10080
dispatchers='(dispatchers=2)(protocol=tcp)'
shared_servers=4
nls_date_format='dd/mm/yyyy hh24:mi:ss'
" >$pfile
echo "Listo"
echo "Comprobando la existencia y contenido del PFILE"
echo ""
cat ${pfile}
