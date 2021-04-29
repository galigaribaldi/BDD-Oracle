--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      29/11/2020
--@Descripcion:         Carga y esport de Archivos PDF en el sitio HGCG_S1  

whenever sqlerror exit rollback;

--Ruta donde se ubicarán los arvhivos PDF's
define p_pdf_path='/tmp/bdd/p06'
set verify off

prompt Limpiando y creando directorio en /tmp/bdd/p06
!rm -rf &p_pdf_path
!mkdir -p &p_pdf_path
!chmod 777 &p_pdf_path

--copiar los arhchivos
!cp /media/sf_BDD/Prácticas/Practica_6/m_archivo* &p_pdf_path
!chmod 755  &p_pdf_path/m_archivo*

!ls &p_pdf_path

---Para hgcg_s1
prompt Conectando a hgcg_s1 como sys para crear objetos de tipo Directory
accept p_sys_password default 'system' prompt 'Password de sys [system]: ' hide
connect sys@hgcg_s1/&p_sys_password as sysdba

Prompt Creando un objeto DIRECTORY para acceder al directorio /tmp/bdd/p06
create or replace directory tmp_dir as '&p_pdf_path';
grant read, write on directory tmp_dir to editorial_bdd;

---Para hgcg_s2
prompt Conectando a hgcg_s2 como sys para crear objetos de tipo Directory
accept p_sys_password default 'system' prompt 'Password de sys [system]: ' hide
connect sys@hgcg_s2/&p_sys_password as sysdba

Prompt Creando un objeto DIRECTORY para acceder al directorio /tmp/bdd/p06
create or replace directory tmp_dir as '&p_pdf_path';
grant read, write on directory tmp_dir to editorial_bdd;

------------------ Cargando datos en hgcg_S1 ----------------------
Prompt conectando a hgcg_S1 con usuario editorial_bdd para cargar datos binarios
connect editorial_bdd/gali123@hgcg_s1


/*
* En este sitio se cargarán los siguientes archivos.
* F_JRC_PAGO_SUSCRIPTOR_1
* NUM_PAGO SUSCRIPTOR_ID RECIBO_PAGO
* --------- ------------- ----------
* 1 1 m_archivo_3.pdf
*
*/
Prompt ejecutando procedimientos para hacer import/export de datos BLOB
@s-00-carga-blob-en-bd.sql
@s-00-guarda-blob-en-archivo.sql

Prompt cargando datos binarios en hgch_s1 para m_archivo3
begin
 carga_blob_en_bd('TMP_DIR','m_archivo_3.pdf','f_hgcg_pago_suscriptor_1','recibo_pago','num_pago','1','suscriptor_id','1');
end;
/

Prompt cargando datos binarios en hgch_s1 para m_archivo4
begin
 carga_blob_en_bd('TMP_DIR','m_archivo_4.pdf','f_hgcg_pago_suscriptor_1','recibo_pago','num_pago','70','suscriptor_id','2');
end;
/

Prompt mostrando el tamaño de los objetos BLOB en BD.
Prompt para f_hgcg_pago_suscriptor_1:

select num_pago,suscriptor_id,dbms_lob.getlength(recibo_pago) as longitud
from f_hgcg_pago_suscriptor_1;

Prompt salvando datos BLOB en directorio TMP_DIR

Prompt m_export_Archivo_4.pdf
begin
 guarda_blob_en_archivo('TMP_DIR','m_export_archivo_4.pdf',
 'f_hgcg_pago_suscriptor_1','recibo_pago','num_pago','70','suscriptor_id','2');
end;
/

Prompt m_export_Archivo_3.pdf
begin
 guarda_blob_en_archivo('TMP_DIR','m_export_archivo_3.pdf',
 'f_hgcg_pago_suscriptor_1','recibo_pago','num_pago','1','suscriptor_id','1');
end;
/


Prompt mostrando el contenido del directorio para validar la existencia del archivo.
!ls -l &p_pdf_path/m_export_archivo_*.pdf

------------------ Cargando datos en hgcg_S1 ----------------------

Prompt conectando a hgcg_S2 con usuario editorial_bdd para cargar datos binarios
connect editorial_bdd/gali123@hgcg_S2

Prompt ejecutando procedimientos para hacer import/export de datos BLOB
@s-00-carga-blob-en-bd.sql
@s-00-guarda-blob-en-archivo.sql


Prompt cargando datos binarios en hgch_s2 para m_archivo2
begin
 carga_blob_en_bd('TMP_DIR','m_archivo_2.pdf','f_hgcg_articulo_1','PDF','ARTICULO_ID','2',null,null);
end;
/

Prompt cargando datos binarios en hgch_s2 para m_archivo1
begin
 carga_blob_en_bd('TMP_DIR','m_archivo_1.pdf','f_hgcg_articulo_1','PDF','ARTICULO_ID','1',null,null);
end;
/
Prompt mostrando el tamaño de los objetos BLOB en BD.
Prompt para f_hgcg_pago_suscriptor_1:

select articulo_id,dbms_lob.getlength(pdf) as longitud
from f_hgcg_articulo_1;

Prompt salvando datos BLOB en directorio TMP_DIR
--guarda_blob_en_archivo('TMP_DIR','m_export_archivo_4.pdf','f_hgcg_pago_suscriptor_1','recibo_pago','num_pago','70','suscriptor_id','2');
begin
 guarda_blob_en_archivo('TMP_DIR','m_export_archivo_1.pdf','f_hgcg_articulo_1','PDF','ARTICULO_ID','1',null,null);
end;
/

begin
 guarda_blob_en_archivo('TMP_DIR','m_export_archivo_2.pdf','f_hgcg_articulo_1','PDF','ARTICULO_ID','2',null,null);
end;
/

Prompt mostrando el contenido del directorio para validar la existencia del archivo.
!ls -l &p_pdf_path/m_export_archivo_*.pdf

Prompt Listo!
disconnect
