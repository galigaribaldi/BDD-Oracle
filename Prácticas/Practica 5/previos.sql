define prompt_name=idle
col global_name new_value prompt_name
col global_name noprint
set heading off
set termout off

select lower(sys_context('userenv','current_user')
||'@'||sys_context('userenv','con_name')) global_name
from dual;
set sqlprompt '&prompt_name > '
set heading on
set termout on
col global_name print

sqlplus sys/system@hgcg as sysdba
sqlplus sys/system@hgcg_s1 as sysdba
sqlplus sys/system@hgcg_s2 as sysdba