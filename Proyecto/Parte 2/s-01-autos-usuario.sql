--@Author:              Cabrera Garibaldi Hernan Galileo 
--@Fecha de creacion:   03/02/2021
--@Descripcion:         Eliminacion y creacion de usuarios

declare
v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where lower(username) ='autos_bdd';
  if v_count > 0 then
    execute immediate 'drop user autos_bdd cascade';
  else
    dbms_output.put_line('El usuario autos_bdd no existe');
  end if;
end;
/

prompt Creando al usuario autos_bdd
create user autos_bdd identified by gali123 quota unlimited on users;

prompt Otorgando privilegios a autos_bdd
grant create SESSION, create table,create trigger, create procedure,create SEQUENCE, create view, create synonym, create database link
to autos_bdd;