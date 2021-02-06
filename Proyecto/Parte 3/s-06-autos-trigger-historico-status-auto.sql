--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en la tabla historico status auto (insert, delete)

create or replace trigger t_dml_historico_status
    instead of insert or update or delete on historico_status_auto
declare
    v_count number;
begin
    case
        ---------------------------------------------------------------------------
        --En el caso de insertar
        ---------------------------------------------------------------------------            
        when inserting then
            ---Com´prbamos si es local
            select count(*) into v_count
            from auto_f3
            where auto_id = :new.auto_id;
            ---------
            if v_count > 0 then
                if to_char(:new.fecha_status, 'yyyy') > '2010' then 
                    -- Se inserta en historico_status_f1
                    insert into historico_status_auto_f1( historico_status_id, fecha_status, auto_id, status_auto_id) 
                    values ( :new.historico_status_id, :new.fecha_status, :new.auto_id, :new.status_auto_id);
                elsif to_char(:new.fecha_status, 'yyyy') <= '2010' then 
                    -- Se inserta en historico_status_f2
                    insert into historico_status_auto_f2( historico_status_id, fecha_status, auto_id, status_auto_id) 
                    values ( :new.historico_status_id, :new.fecha_status, :new.auto_id, :new.status_auto_id);
                else 
                    -- No se cumple con alguna regla
                    raise_application_error(-20010, 'Fecha incorrecta!');
                end if;
            else
                raise_application_error(-20010, 'Error en el fragmento padre!');
            END if;
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
            if to_char(:new.fecha_status, 'yyyy') > '2010' then 
                -- Se elimina en historico_status_f1
                delete from historico_status_auto_f1 where historico_status_id = :old.historico_status_id;
            elsif to_char(:new.fecha_status, 'yyyy') <= '2010' then 
                -- Se elimina en historico_status_f2
                delete from historico_status_auto_f2 where historico_status_id = :old.historico_status_id;
            else 
                raise_application_error(-20010, 'Solo estan permitidas las claves AME y EUR');
            end if;
    end case;
end;
/
