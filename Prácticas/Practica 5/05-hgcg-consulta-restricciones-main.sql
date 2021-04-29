--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/11/2020
--@Descripcion:         Consulta de fragmentos creacos en hgcg-pc

prompt Conectando a S1 - hgcg S1
connect editorial_bdd@hgcg_s1
@s-05-consultas-restricciones.sql

prompt Conectando a S2 - hgcg S2
connect editorial_bdd@hgcg_s2
@s-05-consultas-restricciones.sql

prompt Listo!
exit