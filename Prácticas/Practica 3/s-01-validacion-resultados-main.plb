
whenever sqlerror exit rollback

accept sys_pwd prompt 'Proporcionar el password de sys: ' hide
accept p_cdb prompt   'Proporcionar el nombre de la CDB   Ejemplo. jrcbd   : '
accept p_pdb_1 prompt 'Proporcionar el nombre de la PDB 1 Ejemplo. jrcbd_s1: '
accept p_pdb_2 prompt 'Proporcionar el nombre de la PDB 2 Ejemplo. jrcbd_s2: '

!echo "===> 1. ORACLE_SID: ${ORACLE_SID}"

Prompt ===> 2. Conectando a CDB$ROOT
connect sys/&&sys_pwd as sysdba

Prompt  ===> 3. Creando procedimientos para validar.

@s-00-funciones-validacion.plb
@s-01-validacion-resultados-pdb.plb

create or replace procedure spv_consulta_pdbs wrapped 
a000000
369
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
7
228 1da
pG0zMX6/eC2xgPey65MMDKviGe4wgwHILkgVfC8CmGAGywNNiaLCafrC4+laQNONtDxdB7nY
jlTKzKzTcJUBI/BIvlTNV6LDTDE/I7vXeKcU5l/A5hFKHw3iy9dCqsU9Uk4xU2r7qcNl7CZ/
jvsCbanPPD4/ZDAvsNSTTXWAzvt6rslauXXtMLaMB61jrEc4rN7BOVpS9Dg5FCt7r6lbvWUv
077yokY8gkn3Zwh+wCtUYmmMq5bbdmhfBtvXY3dOe2lyC7Wimk50l3Sa4CJ2dVG+OWbrUF5i
AshwF2gfQpDh8FYZ29QhoFbDyOhaWAyMHG/ojy8589gW/1A4qhwoIskMpm4ag8NL2nGXc9wP
SgFMrNSmwSNj9zH/P6SbTUQe1CR0nYLcrxciHodH7sRPZHlV35q8BfzXPI54SmIhsvHgQT4I
uXvkaOyxXEwgsbAZ+Cd8RfK26463sA+M1sid

/
show errors

Prompt 4. ===> Conectando a &&p_pdb_1
connect sys/&&sys_pwd@&&p_pdb_1 as sysdba

Prompt 5. ===> Creando procedimientos para validar.
@s-00-funciones-validacion.plb
@s-01-validacion-resultados-pdb.plb


Prompt 6. ===> Conectando a &&p_pdb_2
connect sys/&&sys_pwd@&&p_pdb_2 as sysdba

Prompt 7. ===> Creando procedimientos para validar.
@s-00-funciones-validacion.plb
@s-01-validacion-resultados-pdb.plb


connect sys/&&sys_pwd as sysdba
set serveroutput on
set verify off
set feedback off

exec spv_print_header
exec spv_consulta_pdbs('&&p_pdb_1','&&p_pdb_2');
exec spv_verifica_nombre('PDB$SEED')

drop function fv_hash;
drop procedure spv_crea_secuencia;
drop procedure spv_print_ok;
drop procedure spv_throw_error;
drop procedure spv_assert;
drop procedure spv_print_header;
drop sequence seq_validacion;
drop procedure spv_consulta_pdbs;
drop procedure spv_verifica_nombre;

connect sys/&&sys_pwd@&&p_pdb_1 as sysdba
set serveroutput on
set verify off
set feedback off

exec spv_verifica_nombre('&&p_pdb_1')

drop function fv_hash;
drop procedure spv_crea_secuencia;
drop procedure spv_print_ok;
drop procedure spv_throw_error;
drop procedure spv_assert;
drop procedure spv_print_header;
drop sequence seq_validacion;
drop procedure spv_verifica_nombre;

connect sys/&&sys_pwd@&&p_pdb_2 as sysdba
set serveroutput on
set verify off
set feedback off

exec spv_verifica_nombre('&&p_pdb_2')

drop function fv_hash;
drop procedure spv_crea_secuencia;
drop procedure spv_print_ok;
drop procedure spv_throw_error;
drop procedure spv_assert;
drop procedure spv_print_header;
drop procedure spv_verifica_nombre;

Prompt 8. ===>  Validación concluida.
exit



