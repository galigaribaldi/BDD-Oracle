--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/01/2021
--@Descripcion:         Script de ejecución para crear de vistas en ambas PDB's

prompt conectandose a hgcg_s1
connect editorial_bdd/gali123@hgcg_s1

prompt Creando vistas en hgcg_s1
@s-04-hgcg-def-vistas.sql
-------------------------------------------------------
-------------------------------------------------------

prompt Conectandose a hgcg_s2
connect editorial_bdd/gali123@hgcg_s2

prompt Creando vistas en hgcg_s1
@s-04-hgcg-def-vistas.sql

prompt Listo!
exit