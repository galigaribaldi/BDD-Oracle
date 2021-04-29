--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      27/11/2020
--@Descripcion:         Otorgar PErmisos al usuario

whenever sqlerror exit rollback;

prompt Conectandose a hgcg_s1 como usuario SYS
connect sys@hgcg_s1 as sysdba
grant create database link, create procedure to editorial_bdd;

prompt Conectandose a hgcg_s2 como usuario SYS
connect sys@hgcg_s2 as sysdba
grant create database link, create procedure to editorial_bdd;

prompt listo!
exit