--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   03/02/2021
--@Descripcion:         Creacion de fragmentos en los 4 nodos

clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando fragmentos para hgcg_s1
prompt =====================================

connect autos_bdd/gali123@hgcg_s1
@s-03-autos-hgcg-s1-ddl.sql

prompt =====================================
prompt Creando fragmentos para hgcg_s2
prompt =====================================

connect autos_bdd/gali123@hgcg_s2
@s-03-autos-hgcg-s2-ddl.sql


prompt =====================================
prompt Creando fragmentos para igcg_s1
prompt =====================================

connect autos_bdd/gali123@igcg_s1
@s-03-autos-igcg-s1-ddl.sql


prompt =====================================
prompt Creando fragmentos para igcg_s2
prompt =====================================

connect autos_bdd/gali123@igcg_s2
@s-03-autos-igcg-s1-ddl.sql
