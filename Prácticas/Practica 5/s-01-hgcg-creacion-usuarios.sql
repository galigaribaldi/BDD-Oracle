--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      dd/mm/yyyy
--@Descripcion:         Creacion de Usuarios para la maquina pc-hgcg

whenever sqlerror exit rollback;

prompt Conectandose a hgcg_s1 como usuario SYS
connect sys@hgcg_s1 as sysdba

prompt Creaando el usuario editorial_bdd
create user editorial_bdd identified by gali123
    quota unlimited on users;
prompt Otorgando Permiso al usuario editorial_bdd en S1
grant create table, create session, create procedure, create sequence to editorial_bdd;


prompt Conectandose a hgcg_s2 como usuario SYS
connect sys@hgcg_s2 as sysdba

prompt Creaando el usuario editorial_bdd en S2
create user editorial_bdd identified by gali123
    quota unlimited on users;
prompt Otorgando Permiso al usuario
grant create table, create session, create procedure, create sequence to editorial_bdd;

prompt Listo

exit
