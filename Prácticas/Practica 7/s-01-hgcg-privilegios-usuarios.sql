--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/01/2021
--@Descripcion:         Otorgar PErmisos al usuario


whenever sqlerror exit rollback;

prompt Conectandose a hgcg_s1 como usuario SYS
connect sys@hgcg_s1 as sysdba
grant create procedure, create synonym, create public synonym, create view, create type to editorial_bdd;
commit;

prompt Conectandose a hgcg_s2 como usuario SYS
connect sys@hgcg_s2 as sysdba
grant create procedure, create synonym, create public synonym, create view, create type to editorial_bdd;
commit;

prompt listo!
--exit