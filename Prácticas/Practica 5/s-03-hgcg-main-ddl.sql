--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/11/2020
--@Descripcion:         Código DDL para al creaci+on de tablas S1 y S2

prompt Comprobando errores para S1
connect editorial_bdd/gali123@hgcg_s1
@pruebas.sql

prompt Comprobando errores para S2
connect editorial_bdd/gali123@hgcg_s2
@pruebas.sql

whenever sqlerror exit rollback;

prompt Conectandose a hgcg_s1 como usuario editorial_bdd
connect editorial_bdd/gali123@hgcg_s1
@s-02-hgcg-n1-ddl.sql

prompt Conectandose a hgcg_s2 como usuario editorial_bdd
connect editorial_bdd/gali123@hgcg_s2
@s-02-hgcg-n2-ddl.sql

prompt Listo!