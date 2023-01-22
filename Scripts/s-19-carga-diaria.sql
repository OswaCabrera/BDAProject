set serveroutput on;
whenever sqlerror exit rollback
----------------------------------------------------------
-------- Redo para la tabla Proveedores-------------------
----------------------------------------------------------
declare
  v_max_id number;
  v_count number;
  cursor cur_insert is
    select proveedor_seq.nextval as proveedor_id, nombre, ap_paterno,
      ap_materno, foto,  TO_DATE('20/01/2022', 'DD/MM/YYYY') as fecha_nacimiento, 
        direccion, telefono_casa, telefono_movil, identificacion, 
        comprobante_domicilio, fecha_estatus, entidad_federativa_id, 
        estatus_proveedor_id, nivel_estudio_id 
      from proveedor sample(60) a where rownum <=3600;
  
  cursor cur_update is
    select * from proveedor sample (20) where rownum <=3600;
begin
   v_count := 0;
  for r in cur_insert loop
    insert into proveedor(proveedor_id, nombre, ap_paterno, ap_materno, foto, 
      fecha_nacimiento, direccion, telefono_casa, telefono_movil, 
      identificacion, comprobante_domicilio, fecha_estatus, 
      entidad_federativa_id, estatus_proveedor_id, nivel_estudio_id )
    values(proveedor_seq.nextval, r.nombre, r.ap_paterno, r.ap_materno, r.foto, 
      r.fecha_nacimiento, r.direccion, r.telefono_casa, r.telefono_movil, 
      r.identificacion, r.comprobante_domicilio, r.fecha_estatus, 
      r.entidad_federativa_id, r.estatus_proveedor_id, r.nivel_estudio_id );
    v_count := v_count + sql%rowcount;
  end loop;

  dbms_output.put_line('Registros insertados en PROVEEDOR: '||v_count);

  select max(proveedor_id) into v_max_id
  from proveedor;

  v_count := 0;
  for r in cur_update loop
      update proveedor set nombre = r.nombre, ap_paterno = r.ap_paterno, 
        ap_materno = r.ap_materno, foto = r.foto, fecha_nacimiento = r.fecha_nacimiento,
        direccion = r.direccion, telefono_casa = r.telefono_casa, 
        telefono_movil = r.telefono_movil, identificacion = r.identificacion, 
        comprobante_domicilio = r.comprobante_domicilio, fecha_estatus = r.fecha_estatus,
        entidad_federativa_id = r.entidad_federativa_id, estatus_proveedor_id = r.estatus_proveedor_id,
        nivel_estudio_id = r.nivel_estudio_id
        where proveedor_id = (select trunc(dbms_random.value(1,v_max_id))from dual);
        v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modificados en Proveedor: '||v_count);

end;
/

----------------------------------------------------------
----- Redo para la tabla HISTORICO_ESTATUS_PROVEEDOR----
----------------------------------------------------------

declare
  cursor cur_insert is
    select proveedor_id
    from proveedor a where exists (
      select 1
      from historico_estatus_proveedor h
      where h.proveedor_id = a.proveedor_id
    ) and rownum <= 1080;

  cursor cur_update is
    select * from historico_estatus_proveedor sample(50)
    where rownum <= 3600;

  cursor cur_delete is
    select * from historico_estatus_proveedor sample(50)
    where rownum <=750;

   v_count number;
begin
  v_count := 0;
  for r in cur_insert loop
    for v_index in 1..5 loop
      insert into historico_estatus_proveedor(historico_estatus_proveedor_id,fecha_estatus,
        estatus_proveedor_id, proveedor_id)
      values(historico_estatus_proveedor_seq.nextval,sysdate+v_index,3,r.proveedor_id);
      v_count := v_count + 1;
    end loop;
  end loop;
  dbms_output.put_line('Registros creados en HISTORICO_ESTATUS_PROVEEDOR: '||v_count);

  v_count := 0;
  for r in cur_update loop
    update historico_estatus_proveedor set 
      fecha_estatus = r.fecha_estatus + dbms_random.value(1,20),
      estatus_proveedor_id = round(dbms_random.value(1,5))
      where historico_estatus_proveedor_id = r.historico_estatus_proveedor_id;
      v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros modificados en HISTORICO_ESTATUS_PROVEEDOR: '||v_count);
  
  v_count := 0;
  for r in cur_delete loop
    delete from historico_estatus_proveedor 
    where historico_estatus_proveedor_id = r.historico_estatus_proveedor_id;
    v_count := v_count + 1;
  end loop;
  dbms_output.put_line('Registros eliminados en HISTORICO_ESTATUS_PROVEEDOR: '||v_count);

end;
/

-- ----------------------------------------------------------
-- -------- Redo para la tabla Proveedor Tipo Servicio-------
-- ----------------------------------------------------------
declare 
  cursor cur_tipo_servicio_insert is
    select tipo_servicio_id 
    from proveedor_tipo_servicio a
    where  exists(
      select 1 from
      proveedor_tipo_servicio p 
      where p.proveedor_tipo_servicio_id = a.proveedor_tipo_servicio_id
    ) and rownum <=1440;

  v_count number;
  
    cursor cur_update is
      select * from proveedor_tipo_servicio sample(95)
      where rownum <=3240;
    
    cursor  cur_delete is
      select * from proveedor_tipo_servicio sample(40)
      where rownum <=1080;
begin

  v_count := 0;
  for r in cur_tipo_servicio_insert loop
      insert into proveedor_tipo_servicio(proveedor_tipo_servicio_id, 
        anios_experiencia,  tipo_servicio_id, proveedor_id)
      values(proveedor_tipo_servicio_seq.nextval, round(dbms_random.value(1, 10)), round(dbms_random.value(1, 200)),round(dbms_random.value(1, 500)));
      v_count := v_count +1;
  end loop;
  dbms_output.put_line('Registros insertados en proveedor_tipo_servicio: '||v_count);
  
  v_count := 0;
  
  for r in cur_update loop
    update proveedor_tipo_servicio set 
      anios_experiencia = round(round(dbms_random.value(1,10))),
      tipo_servicio_id = round(round(dbms_random.value(1,200))),
      proveedor_id = round(dbms_random.value(1, 500))
      where proveedor_tipo_servicio_id = r.proveedor_tipo_servicio_id;
      v_count := v_count +1;
  end loop;
  dbms_output.put_line('Registros modificados en proveedor_tipo_servicio: '||v_count);

  v_count := 0;
end;
/
----------------------------------------------------------
-------- Redo para la tabla Evidencia Servicio-------------------
----------------------------------------------------------
declare 
  cursor cur_evidencia_servicio_insert is
    select evidencia_servicio_id 
    from evidencia_servicio a
    where  exists(
      select 1 from
      evidencia_servicio p 
      where p.evidencia_servicio_id = a.evidencia_servicio_id
    ) and rownum <=3600;

  v_count number;
  
    cursor cur_update is
      select * from evidencia_servicio sample(95)
      where rownum <3240;
    
    cursor cur_delete is
      select * from evidencia_servicio sample(40)
      where rownum <=3240;
begin

  v_count := 0;
  
  for r in cur_evidencia_servicio_insert loop
      insert into evidencia_servicio(evidencia_servicio_id, 
        fecha, descripcion, proveedor_id)
      values(evidencia_servicio_seq.nextval, sysdate,
      dbms_random.string('l',250), round(dbms_random.value(1, 200)));
      v_count := v_count +1;
  end loop;
  dbms_output.put_line('Registros insertados en evidencia_servicio: '||v_count);
  
  v_count := 0;
  
  for r in cur_update loop
    update evidencia_servicio set 
      fecha = add_months(sysdate, round(dbms_random.value(1, 36))),
      descripcion = dbms_random.string('l',250), 
      proveedor_id = round(dbms_random.value(1, 500))
      
      where evidencia_servicio_id = r.evidencia_servicio_id;
      v_count := v_count +1;
  end loop;
  dbms_output.put_line('Registros modificados en evidencia_servicio: '||v_count);

  v_count := 0;

end;
/
----------------------------------------------------------
-------- Redo para la tabla Imagen-------------------
----------------------------------------------------------

declare 
  cursor cur_imagen_insert is
    select imagen_id 
    from imagen a
    where exists(
      select 1 from
      imagen p 
      where p.imagen_id = a.imagen_id
    ) and rownum <=1800;

  v_count number;
  
    cursor cur_update is
      select * from imagen sample(95)
      where rownum <=3240;
    
begin

  v_count := 0;
  
  for r in cur_imagen_insert loop
      insert into imagen(imagen_id, 
        descripcion, archivo, evidencia_servicio_id)
      values(imagen_seq.nextval, dbms_random.string('l',100),
      utl_raw.cast_to_raw(dbms_random.string('l',20)), round(dbms_random.value(1, 100)));
      v_count := v_count +1;
  end loop;
  dbms_output.put_line('Registros insertados en imagen: '||v_count);
  
  v_count := 0;
  for r in cur_update loop
    update imagen set 
      descripcion = dbms_random.string('l',250),
      archivo =  utl_raw.cast_to_raw(dbms_random.string('l',20)), 
      evidencia_servicio_id = round(dbms_random.value(1, 100))
      
      where imagen_id = r.imagen_id;
      v_count := v_count +1;
  end loop;
  dbms_output.put_line('Registros modificados en imagen: '||v_count);

end;
/

-- ----------------------------------------------------------
-- -------- Redo para la tabla Clientes-------------------
-- ----------------------------------------------------------

declare
  v_max_id number;
  v_count number;
  cursor cur_insert is
    select cliente_seq.nextval as cliente_id, fecha_registro,nombre_usuario,
     contrasenia,email,telefono, direccion, tipo
    from cliente sample(50) a where rownum <=3600;
  
  cursor cur_update is
    select * from cliente sample (50) where rownum <=1800;

  cursor cur_insert_empre is
    select cliente_seq_aux.nextval as cliente_id, descripcion,nombre,
     logotipo,numero_empleados
    from empresa sample(50) a where rownum <=750;

  cursor cur_insert_persona is
    select cliente_seq_aux.nextval as cliente_id, nombre, foto, curp,
    fecha_nacimiento
    from persona sample(50) a where rownum <=2700;
begin
   v_count := 0;
  for r in cur_insert loop
    insert into cliente (cliente_id, fecha_registro,nombre_usuario,
     contrasenia,email,telefono, direccion, tipo)
    values(r.cliente_id, r.fecha_registro,dbms_random.string('l',20),
      r.contrasenia,r.email,r.telefono,r.direccion,r.tipo);
    v_count := v_count + sql%rowcount;
  end loop;

  dbms_output.put_line('Registros insertados en CLIENTE: '||v_count);

  for e in cur_insert_empre loop 
    insert into empresa (cliente_id, descripcion, nombre, logotipo, numero_empleados)
    values (e.cliente_id, e.descripcion, e.nombre, e.logotipo, e.numero_empleados);
  end loop;

  dbms_output.put_line('Registros insertados en empresa: '||v_count);

  for p in cur_insert_persona loop
    insert into persona (cliente_id, nombre, foto, curp, fecha_nacimiento)
    values (p.cliente_id, p.nombre, p.foto, dbms_random.string('l',18), p.fecha_nacimiento);
  end loop;

  dbms_output.put_line('Registros insertados en CLIENTE: '||v_count);

  select max(cliente_id) into v_max_id  from cliente;

  v_count := 0;
  for r in cur_update loop
      update cliente set fecha_registro = r.fecha_registro, nombre_usuario = dbms_random.string('l',25), contrasenia = r.contrasenia,
        email = r.email, telefono = r.telefono, direccion = r.direccion, 
        tipo = r.tipo
        where cliente_id = (select trunc(round(dbms_random.value(1,v_max_id))) from dual);
        v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modificados en CLIENTE: '||v_count);

end;
/

----------------------------------------------------------
-------- Redo para la tabla Servicios-------------------
----------------------------------------------------------

declare
  v_max_id number;
  v_count number;
  cursor cur_insert is
    select servicio_seq.nextval as servicio_id, fecha_servicio,descripcion_servicio,descripcion_detallada,
      fecha_estatus, precio, instrucciones, mensualidades,  proveedor_id, cliente_id, 
      historico_estatus_servicio_id, estatus_servicio_id, tipo_servicio_id
    from servicio sample(60) a where rownum <=3600;
  
  cursor cur_update is
    select estatus_servicio_id, fecha_estatus from servicio sample (60) where rownum <=1080;
begin
   -- insert
   v_count := 0;
  for r in cur_insert loop
    insert into servicio (servicio_id, fecha_servicio, descripcion_servicio, descripcion_detallada,
      fecha_estatus, precio, instrucciones, mensualidades, proveedor_id, cliente_id,
      historico_estatus_servicio_id, estatus_servicio_id, tipo_servicio_id)
    values(r.servicio_id, r.fecha_servicio, r.descripcion_servicio, r.descripcion_detallada,
      r.fecha_estatus, r.precio, r.instrucciones, r.mensualidades, r.proveedor_id, r.cliente_id,
      r.historico_estatus_servicio_id, r.estatus_servicio_id, r.tipo_servicio_id);
    v_count := v_count + sql%rowcount;
  end loop;

  dbms_output.put_line('Registros insertados en SERVICIO: '||v_count);

  select max(servicio_id) into v_max_id
  from servicio;
  -- update 
  v_count := 0;
  for r in cur_update loop
      update servicio set estatus_servicio_id = r.estatus_servicio_id, fecha_estatus = r.fecha_estatus
        where servicio_id = (select trunc(round(dbms_random.value(1,v_max_id)))from dual);
        v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modificados en SERVICIO: '||v_count);

end;
/


-- --------------------------------------------------
-- ---- Redo para la tabla PAGO-----
-- ---------------------------------------------------


declare 
  cursor cur_pagos_insert is
    select servicio_id 
    from servicio s
    where exists(
      select 1 from
      pago p 
      where p.servicio_id = s.servicio_id
    ) and rownum <=360;

  v_count number;
  
    cursor cur_update is
      select * from pago sample(90)
      where rownum <=2940;
    
    cursor cur_delete is
      select * from pago sample(40)
      where rownum <=720;
begin

  v_count := 0;
  --insert 
  for r in cur_pagos_insert loop
    for i in 1 .. 3 loop
      insert into pago(pago_id, tarjeta_id,fecha_pago,importe, comision, servicio_id)
      values(pago_seq.nextval, i ,TO_DATE('20/01/2022', 'DD/MM/YYYY'), 1200, 120, r.servicio_id);
      v_count := v_count +1;
  end loop;
  end loop;
  dbms_output.put_line('Registros insertados en PAGO: '||v_count);
  
  v_count := 0;
  ---update
  for r in cur_update loop
    update pago set 
      fecha_pago = (fecha_pago + round(dbms_random.value(1,100))), 
      importe = importe + round(round(dbms_random.value(1,1000)),2)
      where pago_id = r.pago_id and servicio_id = r.servicio_id;
      v_count := v_count +1;
  end loop;
  dbms_output.put_line('Registros modificados en PAGO: '||v_count);

  v_count := 0;
  --delete
  for r in cur_delete loop
    delete from pago
    where pago_id = r.pago_id
    and servicio_id = r.servicio_id;
    v_count := v_count +1;
  end loop;
  dbms_output.put_line('Registros eliminados en PAGO: '||v_count);

end;
/

-- --------------------------------------------------
-- -------- Redo para la tabla CALIFICACION-------------------
-- ---------------------------------------------------

declare
  v_max_id number;
  v_count number;
  cursor cur_insert is
    select calificacion_seq.nextval as calificacion_id, comentario, calificacion,
    servicio_id
    from calificacion sample(60) a where rownum <=1080;
  
begin
   -- insert
   v_count := 0;
  for r in cur_insert loop
    insert into calificacion (calificacion_id, comentario,calificacion, servicio_id)
    values(r.calificacion_id, r.comentario,r.calificacion, r.servicio_id);
    v_count := v_count + sql%rowcount;
  end loop;

  dbms_output.put_line('Registros insertados en CALIFICACION: '||v_count);

end;
/

--------------------------------------------------
---- Redo para la tabla TARJETA_CLIENTE-----
---------------------------------------------------

declare
  cursor cur_insert is 
    select cliente_id from cliente c 
    where exists (
      select 1
      from tarjeta t
      where t.cliente_id = c.cliente_id
    ) and rownum <= 1440;
  
  v_count number;

   
begin

  -- insert
  v_count := 0;
  for r in cur_insert loop
    insert into tarjeta(tarjeta_id,numero,fecha_expiracion,cliente_id)
    values(
      tarjeta_seq.nextval,round(dbms_random.value(1000000000000000,9999999999999999)), TO_DATE('20/01/2022', 'DD/MM/YYYY'), r.cliente_id
    );
    v_count := v_count +1;
  end loop;

  dbms_output.put_line('Registros insertados en TARJETA_CLIENTE: '||v_count);

 
end;
/
