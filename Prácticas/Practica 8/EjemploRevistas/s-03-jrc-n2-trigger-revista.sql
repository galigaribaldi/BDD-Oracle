--@Autor:          Jorge A. Rodriguez C
--@Fecha creación:  29/04/2017
--@Descripción:    Definición de instead of trigger para la vista revista
create or replace trigger t_dml_revista
instead of insert or update or delete on revista
declare
	v_tipo revista_1.tipo%type;
	v_nombre revista_1.nombre%type;
	v_pdf revista_3.pdf%type;
	v_size number;
begin
	case 
		when inserting then
			--primero se valida de forma local
			if :new.tipo = 'B' then
				insert into revista_2(revista_id,tipo,nombre)
				values(:new.revista_id,:new.tipo,:new.nombre);
			elsif :new.tipo = 'A' then
				insert into revista_1(revista_id,tipo,nombre)
				values(:new.revista_id,:new.tipo,:new.nombre);
			else
				raise_application_error(20001, 
					'Valor incorrecto para el campo tipo : '
        			|| :new.tipo
                   	|| ' Solo se permiten los valores A , B ');
			end if;
			--inserta el binario, al ser local 
			insert into revista_3(revista_id,pdf) 
			values(:new.revista_id,:new.pdf);
			
		
		when updating then

			--el registro se queda en el sitio B
			if :new.tipo ='B' and :old.tipo = 'B' then
				update revista_2 set revista_id = :new.revista_id,
					tipo=:new.tipo,nombre=:new.nombre
				where revista_id = :old.revista_id;

			--el registro cambia de sitio S1->S2
			elsif :new.tipo='B' and :old.tipo = 'A' then
				delete from revista_1 where revista_id = :old.revista_id;
				insert into revista_2(revista_id,tipo,nombre)
				values(:new.revista_id,:new.tipo,:new.nombre);

			--el registro se queda en el sitio A
			elsif :new.tipo ='A' and :old.tipo ='A' then
				update revista_1 set revista_id = :new.revista_id,
					tipo=:new.tipo,nombre=:new.nombre
				where revista_id = :old.revista_id;	
			
			--el registro cambia de sitio S2->S1	
			elsif :new.tipo = 'A' and :old.tipo ='B' then
				delete from revista_2 where revista_id = :old.revista_id;
				insert into revista_1(revista_id,tipo,nombre)
				values(:new.revista_id,:new.tipo,:new.nombre);
			
			--valores invalidos
			else
				raise_application_error(20001, 
					'Valor incorrecto para el campo tipo : '
        			|| :new.tipo
                   	|| ' Solo se permiten los valores A , B ');
			end if;

			--actualiza el binario de forma local
			update revista_3 set revista_id = :new.revista_id,
				pdf= :new.pdf where revista_id = :old.revista_id;	

		when deleting then 
			if :old.tipo ='B' then
				delete from revista_2 where revista_id = :old.revista_id;
			elsif :old.tipo='A' then
				delete from revista_1 where revista_id  = :old.revista_id;
			else
				raise_application_error(20001, 
					'Valor incorrecto para el campo tipo : '
        			|| :old.tipo
                   	|| ' Solo se permiten los valores A , B ');
			end if;
			--elimina el binario
			delete from revista_3 where revista_id = :old.revista_id;
	end case;
end;
/