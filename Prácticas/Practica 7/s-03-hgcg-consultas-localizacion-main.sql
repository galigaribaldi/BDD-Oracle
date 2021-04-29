--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/01/2021
--@Descripcion:         Script Main de realizar consultas en sinonimos

prompt Conectando a hgcg_s1
connect editorial_bdd/gali123@hgcg_s1

prompt Realizando conteo de registros
set serveroutput on 
start s-03-hgcg-consultas-localizacion.sql

-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

prompt Conectando a hgcg_s2
connect editorial_bdd/gali123@hgcg_s2

prompt Realizando conteo de registros
set serveroutput on 
start s-03-hgcg-consultas-localizacion.sql