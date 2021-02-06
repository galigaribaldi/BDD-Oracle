--@Autor:           Cabrera Garibaldi Hernan Galileo
--@Fecha creación:  04/02/2021
--@Descripción:     Creación de sinonimos -main
-- alter pluggable database <pdb_name> open;
clear screen
whenever sqlerror exit rollback;

prompt =====================================
prompt Creando sinonimos para hgcg_s1
prompt =====================================
connect autos_bdd/autos_bdd@hgcg_s1
@s-04-autos-hgcg-s1-sinonimos.sql
@s-04-autos-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para hgcg_s2
prompt =====================================
connect autos_bdd/autos_bdd@hgcg_s2
@s-04-autos-hgcg-s2-sinonimos.sql
@s-04-autos-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para igcg_s1
prompt =====================================
connect autos_bdd/autos_bdd@igcg_s1
@s-04-autos-igcg-s1-sinonimos.sql
@s-04-autos-valida-sinonimos.sql

prompt =====================================
prompt Creando sinonimos para igcg_s2
prompt =====================================
connect autos_bdd/autos_bdd@igcg_s2
@s-04-autos-igcg-s2-sinonimos.sql
@s-04-autos-valida-sinonimos.sql