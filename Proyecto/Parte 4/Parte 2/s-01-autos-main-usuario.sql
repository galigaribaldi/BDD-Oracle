--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   03/02/2021
--@Descripcion:         Creacion de usuarios en los 4 nodos

clear screen
whenever sqlerror exit rollback;
set serveroutput on

Prompt Inciando creacion/eliminacion de usuarios.
accept syspass char prompt 'Proporcione el password de sys: ' hide

prompt =====================================
prompt Creando usuario en hgcg_s1
prompt =====================================
connect sys/&&syspass@hgcg_s1 as sysdba
@s-01-autos-usuario.sql

prompt =====================================
prompt Creando usuario en hgcg_s2
prompt =====================================
connect sys/&&syspass@hgcg_s2 as sysdba
@s-01-autos-usuario.sql

prompt =====================================
prompt Creando usuario en igcg_s1
prompt =====================================
connect sys/&&syspass@igcg_s1 as sysdba
@s-01-autos-usuario.sql

prompt =====================================
prompt Creando usuario en igcg_s2
prompt =====================================
connect sys/&&syspass@igcg_s2 as sysdba
@s-01-autos-usuario.sql
