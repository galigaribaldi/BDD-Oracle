--@Autor:           Cabrera Garibaldi Hernan Galileo
--@Fecha creación:  06/02/2021
--@Descripción:     Archivo de carga inicial para poblado manual de datos.
clear screen
whenever sqlerror exit rollback;
Prompt ======================================
Prompt Cargando catalogos replicados en hgcg_s1
Prompt ======================================
connect autos_bdd/autos_bdd@hgcg_s1
delete from status_auto;
@carga-inicial/status_auto.sql
Prompt ======================================
Prompt Cargando catalogos replicados en hgcg_s2
Prompt ======================================
connect autos_bdd/autos_bdd@hgcg_s2
delete from status_auto;
@carga-inicial/status_auto.sql
Prompt ======================================
Prompt Cargando catalogos replicados en igcg_s1
Prompt ======================================
connect autos_bdd/autos_bdd@igcg_s1
delete from status_auto;
@carga-inicial/status_auto.sql
Prompt ======================================
Prompt Cargando catalogos replicados en igcg_s2
Prompt ======================================
connect autos_bdd/autos_bdd@igcg_s2
delete from status_auto;
@carga-inicial/status_auto.sql
Prompt Haciendo Commit de todos los datos !
commit;
Prompt Listo !
exit