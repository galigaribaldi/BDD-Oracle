--@Autor:          Jorge A. Rodriguez C
--@Fecha creación:  29/04/2017
--@Descripción:    sentencias de prueba


Prompt Copiando Pdfs de muestra a /tmp
!cp pdf/*.pdf  /tmp

declare
	v_count number;				
begin
	
	dbms_output.put_line('Probando trasparencia de eliminacion');
	delete from revista;

	dbms_output.put_line('validando que existen 0 registros en los fragmentos');

	select count(*) into v_count
	from (
		select 1 from revista_1
		union
		select 1 from revista_2
		union
		select 2 from revista_3
	) q1;

	if v_count <> 0 then
		raise_application_error(20001, 'Se encontraro registros para la tabla revista');
	else
		dbms_output.put_line('Ok, 0 registros encontrados');
	end if;

	--Probando insercion!ls
	dbms_output.put_line('insertando  revista 101  tipo A');
	insert into revista(revista_id,tipo,nombre,pdf) values(
		101,'A','Revista 101',load_blob_from_file('TMP_DIR','sample1.pdf')); 


	dbms_output.put_line('insertando  revista 102  tipo B');
	insert into revista(revista_id,tipo,nombre,pdf) values(
		102,'B','Revista 102',load_blob_from_file('TMP_DIR','sample2.pdf')); 

	dbms_output.put_line('insertando  revista 103  tipo A');
	insert into revista(revista_id,tipo,nombre,pdf) values(
		103,'A','Revista 103',load_blob_from_file('TMP_DIR','sample3.pdf')); 

	dbms_output.put_line('Insertando  revista 104  tipo B');
	insert into revista(revista_id,tipo,nombre,pdf) values(
		104,'B','Revista 100',load_blob_from_file('TMP_DIR','sample4.pdf')); 

	dbms_output.put_line('insertando  revista 105  tipo A');
	insert into revista(revista_id,tipo,nombre,pdf) values(
		105,'A','Revista 100',load_blob_from_file('TMP_DIR','sample5.pdf')); 

	select count(*) into v_count from revista;
	
	if v_count <> 5 then
		raise_application_error(20001, 'Insercion invalida, se esperaban 5 registros');
	else
		dbms_output.put_line('OK, '|| v_count|| ' registros encontrados');
	end if;

	--confirmar cambios antes de modificar
	commit;

	dbms_output.put_line('Probando update');

	update revista set nombre='revista 100-1' where revista_id = 101;
	update revista set nombre='revista 100-2' where revista_id = 102;
	update revista set nombre='revista 100-3' where revista_id = 103;
	update revista set nombre='revista 100-4' where revista_id = 104;
	update revista set nombre='revista 100-5' where revista_id = 105;

	dbms_output.put_line('Probando update con datos binarios, se asignan al reves');

	dbms_output.put_line('Cambiando pdf 1');
	update revista set pdf = load_blob_from_file('TMP_DIR','sample5.pdf')
	where revista_id = 1;
	
	dbms_output.put_line('Cambiando pdf 2');
	update revista set pdf = load_blob_from_file('TMP_DIR','sample4.pdf')
	where revista_id = 2;

	dbms_output.put_line('Cambiando pdf 3');
	update revista set pdf = load_blob_from_file('TMP_DIR','sample3.pdf')
	where revista_id = 3;

	dbms_output.put_line('Cambiando pdf 4');
	update revista set pdf = load_blob_from_file('TMP_DIR','sample2.pdf')
	where revista_id = 4;

	dbms_output.put_line('Cambiando pdf 5');
	update revista set pdf = load_blob_from_file('TMP_DIR','sample1.pdf')
	where revista_id = 5;

	dbms_output.put_line(' confirmando cambios');
	commit;
	exception
		when others then
		dbms_output.put_line('error al ejecutar la prueba, se hara rollback');
		rollback;
		raise;
end;
/
select revista_id,tipo,nombre,dbms_lob.getlength(pdf)pdf_length from revista;
