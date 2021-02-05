--@Autor:           Cabrera Garibaldi Hernan Galileo
--@Fecha creación:  05/02/2021
--@Descripción:     Creación de vistas para todos los sitios

clear screen
whenever sqlerror exit rollback;

prompt ===========================================
prompt Creando vistas para hgcg_s1
prompt ===========================================

connect autos_bdd/gali123@hgcg_s1
prompt creando vistas que no requieren manejo de BLOBs
@s-05-autos-vistas.sql

prompt creando tablas temporales
@s-05-autos-tablas-temporales.sql

prompt creando objetos para manejo de BLOBs
@s-05-autos-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-autos-hgcg-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para hgcg_s2
prompt ===========================================

connect autos_bdd/gali123@hgcg_s2
prompt creando vistas que no requieren manejo de BLOBs
@s-05-autos-vistas.sql

prompt creando tablas temporales
@s-05-autos-tablas-temporales.sql

prompt creando objetos para manejo de BLOBs
@s-05-autos-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-autos-hgcg-s2-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para igcg_s1
prompt ===========================================
connect autos_bdd/gali123@igcg_s1

prompt creando vistas que no requieren manejo de BLOBs
@s-05-autos-vistas.sql

prompt creando tablas temporales
@s-05-autos-tablas-temporales.sql

prompt creando objetos para manejo de BLOBs
@s-05-autos-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-autos-igcg-s1-vistas-blob.sql

prompt ===========================================
prompt Creando vistas para igcg_s2
prompt ===========================================

connect autos_bdd/gali123@igcg_s2
prompt creando vistas que no requieren manejo de BLOBs
@s-05-autos-vistas.sql

prompt creando tablas temporales
@s-05-autos-tablas-temporales.sql

prompt creando objetos para manejo de BLOBs
@s-05-autos-funciones-blob.sql

prompt creando vistas con soporte para BLOBs
@s-05-autos-igcg-s2-vistas-blob.sql

prompt Listo!
disconnect