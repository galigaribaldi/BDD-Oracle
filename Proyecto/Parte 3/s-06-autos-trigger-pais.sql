--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar
--                      DML en la tabla pais (insert, delete)

create or replace trigger t_dml_pais
    instead of insert or update or delete on pais
declare
begin
    case
        ---------------------------------------------------------------------------
        --En el caso de insertar
        ---------------------------------------------------------------------------            
        when inserting then
            if upper(:new.region) = 'AME' then 
                -- Se inserta en pais_f1
                insert into pais_f1( pais_id, nombre, clave, region) 
                values ( :new.pais_id, :new.nombre, :new.clave, :new.region);
            elsif upper(:new.region) = 'EUR' then 
                -- Se inserta en pais_f2
                insert into pais_f2( pais_id, nombre, clave, region) 
                values ( :new.pais_id, :new.nombre, :new.clave, :new.region);
            else 
                -- No se cumple con alguna regla
                raise_application_error(-20010, 'Solo estan permitidas las claves AME y EUR');
            end if;
        ---------------------------------------------------------------------------
        --En el caso de Actualizar
        ---------------------------------------------------------------------------        
        when updating then
            raise_application_error(-20030, 
            'La instruccion update no se encuentra implementada');
        ---------------------------------------------------------------------------
        --En el caso de eliminar
        ---------------------------------------------------------------------------        
        when deleting then 
            if upper(:old.region) = 'AME' then 
                -- Se elimina en pais_f1
                delete from pais_f1 where pais_id = :old.pais_id;
            elsif upper(:old.region) = 'EUR' then 
                -- Se elimina en pais_f2
                delete from pais_f2 where pais_id = :old.pais_id;
            else 
                raise_application_error(-20010, 'Solo estan permitidas las claves AME y EUR');
            end if;
    end case;
end;
/
show errors;