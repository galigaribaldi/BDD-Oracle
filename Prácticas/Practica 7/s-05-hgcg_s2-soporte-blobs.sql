--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/01/2021
--@Descripcion:         Definicion de vistas para manejo de BLOBs en la PDB hgcg_s2

prompt connectando a hgcg_s2
connect editorial_bdd/gali123@hgcg_s2
--    select  dbms_lob.getlength(pdf) longitud from my_table where id = 1;
prompt  ---
prompt Paso 1. Creando vistas con columnas BLOB locales
prompt  ---

CREATE OR REPLACE VIEW articulo AS
    SELECT art1.articulo_id, art2.titulo, art2.resumen, art2.texto,art1.pdf FROM articulo_1 art1
    JOIN ARTICULO_2 art2 ON art2.articulo_id = art1.articulo_id;

CREATE OR REPLACE VIEW pago_suscriptor_ AS
    SELECT suscriptor_id, num_pago, fecha_pago, importe,recibo_pago
        FROM PAGO_SUSCRIPTOR_2; 
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

prompt  ---
prompt Paso 2. Creando objetos type para vistas que involucran BLOBs remotos
prompt  ---

prompt Creando  PDF para pago_suscriptor_1
create or replace type recibo_pago_type as object (
	pago_suscriptor_1_id number(38,0),
	num_pago number(38,0),
	fecha_pago date,
	importe number(38,0),
	recibo_pago blob
);
/

--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

prompt  ---
prompt Paso 3. Creando objetos Table para vistas que involucran BLOBs remotos
prompt  ---

---Recibo Pago PDF
create TYPE recibo_pago_table as table of recibo_pago_type;
/
show errors;

--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

prompt  ---
prompt Paso 4. Creando tablas temporales para vistas que involucran BLOBs Remotos
prompt  ---

---Para suscriptor 2
create GLOBAL TEMPORARY TABLE t_recibo_pago(
	pago_suscriptor_1_id number(38) constraint t_pago_suscriptor_2_pk primary key,
	num_pago number(38,0),
	fecha_pago date,
	importe number(38,0),
	recibo_pago blob
) on COMMIT preserve rows;

--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

prompt  ---
prompt Paso 5. Creando funcion con estrategia 1 para vistas que involucran BLOBs Remotos
prompt  ---
--Recibo Pago
------------------------------------------------------------------------------------------
create or replace function get_remote_recibo_pago return recibo_pago_table pipelined is
	pragma autonomous_transaction;
	v_temp_pdf blob;
	begin
 		--inicia txn autónoma 1
 		--asegura que no haya registros
 		delete from t_recibo_pago;
 		--inserta los datos obtenidos del fragmento remoto a la tabla temporal.
 		insert into t_recibo_pago select suscriptor_id,num_pago,fecha_pago,importe,recibo_pago from pago_suscriptor_1;
 		--termina txn autónoma 1 antes de generar la lista de datos
 		commit;
 		--obtiene los registros de la tabla temporal y los regresa como objetos tipo revista_type
 		for cur in (select pago_suscriptor_1_id,num_pago,fecha_pago,importe,recibo_pago from t_recibo_pago) loop
 			pipe row(recibo_pago_type(cur.pago_suscriptor_1_id,cur.num_pago,cur.fecha_pago,cur.importe,cur.recibo_pago));
 		end loop;
 --inicia txn autónoma 2 para limpiar la tabla
 --elimina los registros de la tabla temporal una vez que han sido obtenidos.
 delete from t_recibo_pago;
 --termina txn autónoma 2
 commit;
 return;
exception
 when others then
 rollback;
 raise;
end;
/
show errors;
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

prompt  ---
prompt Paso 6. Creando funcion con estrategia 2 para vistas que involucran BLOBs Remotos
prompt  ---

	--funcion empleada para la estrategia 2
	--Recibo Pago
	create or replace function get_remote_recibo_pago_by_id(v_suc_pago in number, v_num_pago in number ) return blob is
		pragma autonomous_transaction;
		v_temp_pdf blob;
		begin
		--dbms_output.put_line('invocando fx '||v_revista_id);
			--asegura que no haya registros
			delete from t_recibo_pago;
			--inserta los datos obtenidos del fragmento remoto a la tabla temporal.
			insert into t_recibo_pago select suscriptor_id,num_pago,fecha_pago,importe,recibo_pago
				from pago_suscriptor_1 where suscriptor_id = v_suc_pago and num_pago = v_num_pago;
			--obtiene el registro de la tabla temporal y lo regresa como blob
			select recibo_pago into v_temp_pdf from t_recibo_pago where pago_suscriptor_1_id = v_suc_pago and num_pago = v_num_pago;
			--elimina los registros de la tabla temporal una vez que han sido obtenidos.
			delete from t_recibo_pago;
			commit;
			dbms_output.put_line('Longitud del PDF: ' || dbms_lob.getlength(v_temp_pdf));
			return v_temp_pdf;
		exception
			when others then
				rollback;
				raise;
	end;
	/


--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

prompt ---
Prompt Paso 7 Crear las vistas con datos BLOB remotos empleando estrategia 1
prompt ---
create or replace view pago_suscriptor_e1 as
	select suscriptor_id, num_pago, fecha_pago, importe,recibo_pago  from PAGO_SUSCRIPTOR_2
  	 	union all
  	select * from table(get_remote_recibo_pago);

--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

prompt ---
Prompt Paso 8 Crear las vistas con datos BLOB remotos empleando estrategia 2
prompt ---

--- Para Pago Suscriptor_2
-- con la estrategia 2
create or replace view pago_suscriptor_e2 as
	select suscriptor_id, num_pago, fecha_pago, importe, recibo_pago 
		from (
	select suscriptor_id, num_pago, fecha_pago, importe, get_remote_recibo_pago_by_id(suscriptor_id, num_pago) recibo_pago from PAGO_SUSCRIPTOR_1
	union all
	select suscriptor_id, num_pago, fecha_pago, importe , recibo_pago from pago_suscriptor_2
		);
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

prompt ---
Prompt Paso 9 Crear un sinonimo con el nombre global del fragmento que apunte a la estrategia 2.
prompt ---
create or replace synonym pago_suscriptor for  pago_suscriptor_e2;
--------------------------------------------------------------------
--------------------------------------------------------------------
--------------------------------------------------------------------

Prompt Listo!
exit
