--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      27/11/2020
--@Descripcion:         Creacion de ligas
prompt Creando liga en hgcg_s1 hacia hgcg_s2 
connect editorial_bdd/gali123@hgcg_s1
drop database link hgcg_s2.fi.unam;
create database link hgcg_s2.fi.unam USING 'HGCG_S2';

prompt Creando liga en hgcg_s2 hacia hgcg_s1
connect editorial_bdd/gali123@hgcg_s2
drop database link hgcg_s1.fi.unam;
create database link hgcg_s1.fi.unam USING 'HGCG_S1';

prompt Listo!