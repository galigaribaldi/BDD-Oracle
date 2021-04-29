--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      29/11/2020
--@Descripcion:         Carga y esport de Archivos PDF en el sitio HGCG_S1

--create or replace directory tmp_dir as '/tmp/bdd';

--connect sys/system@hgcg_s1 as sysdba;
--grant read, write on directory tmp_dir to editorial_bdd;
create or replace procedure guarda_blob_en_archivo (
    v_directory_name          in varchar2,
    v_src_file_name          in varchar2,
    v_table_name              in varchar2,
    v_blob_column_name        in varchar2,
    v_pk1_column_name          in varchar2,
	  v_pk1_column_value	        in varchar2,
    v_pk2_column_name	        in varchar2,
    v_pk2_column_value	      in varchar2
  ) is
  -- Declaracion de Variables 
  v_file                    utl_file.FILE_TYPE;
  v_buffer_size             number :=32767;
  v_buffer                  RAW(32767);
  v_blob                    blob;
  v_blob_length             number;
  v_position                number;
----
  v_query             varchar2(2000);
  v_src_offset        number := 1;
  v_dest_offset       number := 1;
  v_src_blob_size     number;
  v_src_blob          bfile; 
  v_dest_blob         blob;
----
  v_valid_table_name 			varchar2(30);
  v_valid_blob_column_name 	varchar2(30);
  v_valid_pk_column_name		varchar2(30);
  v_valid_pk2_column_name		varchar2(30);
  v_valid_pk1_column_name		varchar2(30);
  begin

	    -- Verificar que los nombres sean válidos para evitar inyección SQL
	    v_valid_table_name := dbms_assert.simple_sql_name(v_table_name);
	    v_valid_blob_column_name := dbms_assert.simple_sql_name(v_blob_column_name);
	    v_valid_pk_column_name := dbms_assert.simple_sql_name(v_pk1_column_name);

	    if v_pk2_column_name is not null then
    		v_valid_pk2_column_name := dbms_assert.simple_sql_name(v_pk2_column_name);
	    end if;

      v_query := 'select '
        || v_valid_blob_column_name
        || ' into :ph_blob '
        || ' from '
        || v_valid_table_name
        || ' where '
        || v_valid_pk_column_name
        || '= :ph_pk_column_value';
         /*v_query := 'update ' || v_valid_table_name
               || ' set ' || v_valid_blob_column_name || '= empty_blob() '
               || ' where ' || v_valid_pk1_column_name || '= :ph_pk1_column_value';*/


      if v_pk2_column_name is not null then
        v_query := v_query || ' and '
          || v_valid_pk2_column_name || '= :ph_pk2_column_value';
      end if;
      -- Impresión para verificar.
      dbms_output.put_line(v_query);

  --ejecuta query dinámico
      if v_pk2_column_name is not null then
          execute immediate v_query into v_blob using
          v_pk1_column_value,v_pk2_column_value;
      else
          execute immediate v_query into v_blob using
          v_pk1_column_value;
      end if;
      v_blob_length := dbms_lob.getlength(v_blob);
      v_position := 1;
      v_file := utl_file.fopen(v_directory_name,v_src_file_name,'wb',32767);

  --lee el archivos por partes hasta completar
    while v_position < v_blob_length loop
        dbms_lob.read(v_blob,v_buffer_size,v_position,v_buffer);
        UTL_FILE.put_raw(v_file,v_buffer,TRUE);
        v_position := v_position+v_buffer_size;
    end loop;

  utl_file.fclose(v_file);

  -- cierra el archivo en caso de error y relanza la excepción.
exception when others then
  if utl_file.is_open(v_file) then
      utl_file.fclose(v_file);
  end if;
  raise;
 end;
 /
show errors;