--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en 
---    la tabla pago auto en hgcg_S2 (insert, delete)
create or replace trigger t_dml_pago_auto
    instead of insert or update or delete on pago_auto
declare
    v_count number;
begin
    case
        ---------------------------------------------------------------------------
        --En el caso de insertar
        ---------------------------------------------------------------------------            
        when inserting then
            ---comprobamos que sea local
            select count(*) into v_count
            from cliente where cliente_id = :new.cliente_id;
            ----
            if v_count > 0 then 
                select count(*) into v_count
                from auto_f2
                where auto_id = :new.auto_id;
                if v_count > 0 then 
                    --- Insertando en la tabla temporañ
                    insert into ti_pago_auto_f2 (cliente_id, auto_id, fecha_pago,importe, recibo_pago) 
                    values (:new.cliente_id, :new.auto_id, :new.fecha_pago, :new.importe, :new.recibo_pago);
                    --- insertando en pago_auto
                    insert into pago_auto_f1
                        select * from ti_pago_auto_f2
                        where cliente_id = :new.cliente_id and auto_id = :new.auto_id;
                    --Borrando la tabla temporal
                    delete from ti_pago_auto_f2
                    where cliente_id = :new.cliente_id and auto_id = :new.auto_id;
                else
                    select count(*) into v_count
                    from auto_f1
                    where auto_id = :new.auto_id;
                    ---
                    if v_count > 0 THEN
                        ---Tabla Temporal
                        insert into ti_pago_auto_f2 (cliente_id, auto_id, fecha_pago, importe, recibo_pago) 
                        values (:new.cliente_id, :new.auto_id, :new.fecha_pago, :new.importe, :new.recibo_pago);
                        --- Insercion en la tabla
                        insert into pago_auto_f1
                            select * from ti_pago_auto_f1
                        where cliente_id = :new.cliente_id and auto_id = :new.auto_id;
                        ---- Borramos de la tabla temporal
                        delete from ti_pago_auto_f1
                        where cliente_id = :new.cliente_id and auto_id = :new.auto_id;
                        ----
                    else
                        raise_application_error(-20020,'No se encontro el registro en el fragmento  padre ');
                    end if;
                end if;
            else
                raise_application_error(-20020, 'Error!');
            end if;
        ---------------------------------------------------------------------------
        --En el caso de Actualizar
        ---------------------------------------------------------------------------        
        when updating then
            raise_application_error(-20030, 
            'No hay, no existe :v');
        ---------------------------------------------------------------------------
        --En el caso de eliminar
        ---------------------------------------------------------------------------        
        when deleting then
            select count(*) into v_count
            from auto_f2
            where auto_id = :old.auto_id;
            ---
            if v_count > 0 then
                delete from pago_auto_f2 where auto_id = :old.auto_id and cliente_id = :old.cliente_id; 
            else
                delete from pago_auto_f1 where auto_id = :old.auto_id and cliente_id = :old.cliente_id; 
            end if;
    end case;
end;
/
show errors;