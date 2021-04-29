--@Autor:          Jorge A. Rodriguez C
--@Fecha creación:  29/04/2017
--@Descripción:    Archivo principal

Prompt Creando tabla temporal solo en S1
connect ejemplo_revistas/ejemplo_revistas@jrcbd_s1
@s-01-jrc-n1-tablas-temporales.sql

Prompt creando funcion load_blob_from_file en sitio 1
@s-02-jrc-carga-blob-archivo.sql

Prompt creando triggers en Sitio 1
@s-03-jrc-n1-trigger-revista.sql
show errors;
@s-03-jrc-n1-trigger-revista_articulo.sql
show errors;
Prompt creando funcion load_blob_from_file en sitio 2
connect ejemplo_revistas/ejemplo_revistas@jrcbd_s2

@s-02-jrc-carga-blob-archivo.sql

Prompt creando trigger en Sitio 2
@s-03-jrc-n2-trigger-revista.sql
show errors;
@s-03-jrc-n2-trigger-revista_articulo.sql
show errors;