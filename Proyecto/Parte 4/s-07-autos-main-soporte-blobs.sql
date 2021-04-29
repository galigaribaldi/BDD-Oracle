--@Autor:           Cabrera Garibaldi Hernan Galileo
--@Fecha creación:  06/02/2021
--@Descripción:     Script principal empleado para configurar el soporte
-- de datos BLOB en los 4 nodos.
Prompt configurando directorios y otorgando registros.
--hgcg_s1
Prompt configurando soporte BLOB para hgcg_s1
connect autos_bdd/autos_bdd@hgcg_s1
@s-07-autos-configuracion-soporte-blobs.sql
--hgcg_s2
Prompt configurando soporte BLOB para hgcg_s2
connect autos_bdd/autos_bdd@hgcg_s2
@s-07-autos-configuracion-soporte-blobs.sql
--igcg_s1
Prompt configurando soporte BLOB para igcg_s1
connect autos_bdd/autos_bdd@igcg_s1
@s-07-autos-configuracion-soporte-blobs.sql
--igcg_s2
Prompt configurando soporte BLOB para igcg_s2
connect autos_bdd/autos_bdd@igcg_s2
@s-07-autos-configuracion-soporte-blobs.sql
Prompt Listo !
Disconnect