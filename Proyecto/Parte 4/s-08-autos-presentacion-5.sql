--@Autor:           Cabrera Garibaldi Hernan Garibaldi
--@Fecha creación:  06/02/2021
--@Descripción:     Validando transparencia de operaciones DELETE. 
create or replace procedure sp_elimina_datos is
begin
 dbms_output.put_line('Eliminando datos');
delete from tarjeta_cliente;
 --completar..

 dbms_output.put_line('Haciendo commit !');
commit;
exception
when others then
dbms_output.put_line('Errores encontrados al eliminar datos');
dbms_output.put_line('Hanciendo rollback');
raise;
rollback;
end;
/
