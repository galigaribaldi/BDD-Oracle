--@Autor:          Jorge A. Rodriguez C
--@Fecha creación:  29/04/2017
--@Descripción:    Definición de instead of trigger para la vista revista
create or replace trigger t_dml_revista_articulo
instead of insert or update or delete on revista_articulo
declare
 	v_count number;
begin
	case 
		when inserting then
			
			--verifica si hay correspondencia local para evitar acceso remoto
			select count(*) into v_count
			from revista_1 
			where revista_id =:new.revista_id;
			--insercion local
			if v_count > 0 then
				insert into revista_articulo_1(revista_articulo_id,
					nombre,num_pagina,revista_id)
				values(:new.revista_articulo_id,:new.nombre,
					:new.num_pagina,:new.revista_id);	
			--insercion remota
			else 
				select count(*) into v_count
				from revista_2 
				where revista_id =:new.revista_id;
				if v_count > 0 then
					insert into revista_articulo_2(revista_articulo_id,
						nombre,num_pagina,revista_id)
					values(:new.revista_articulo_id,:new.nombre,
						:new.num_pagina,:new.revista_id);
			 	else
			 		raise_application_error(20001, 
                		'Error de integridad para el campo revista_id : '
                		||  :new.revista_id
                		|| ' No se encontró el registro padre en fragmentos');   
			 	end if;
			end if;
		
		when updating then
				
				dbms_output.put_line('implementar');

		when deleting then 
				
				dbms_output.put_line('implementar');			
	end case;
end;
/