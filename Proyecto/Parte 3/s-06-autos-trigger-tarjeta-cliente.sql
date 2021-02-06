--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en la tabla taejeta Cliente (insert, delete)
create or replace trigger t_dml_tarjeta_cliente
    instead of insert or update or delete on tarjeta_cliente
declare
    v_count number;
begin
    case
        ---------------------------------------------------------------------------
        --En el caso de insertar
        ---------------------------------------------------------------------------            
        when inserting then
            ----
            select count(*) into v_count
            from cliente
            where cliente_id = :new.cliente_id;
            ----        
            if v_count > 0 then
                ---tarjeta Cliente f1
                insert into tarjeta_cliente_f1(cliente_id, anio_expira, mes_expira, tipo)
                values(:new.cliente_id, :new.anio_expira, :new.mes_expira, :new.tipo);
                ---tarjeta Cliente f2
                insert into tarjeta_cliente_f2(cliente_id, num_tarjeta, codigo_seguridad)
                values(:new.cliente_id, :new.num_tarjeta, :new.codigo_seguridad);
            else
                raise_application_error(-20010,'Error en el registro Padre ');
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
            delete from tarjeta_cliente_f1 where cliente_id = :old.cliente_id;
            delete from tarjeta_cliente_f2 where cliente_id = :old.cliente_id;
    end case;
end;
/
show errors;