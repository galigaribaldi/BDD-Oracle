--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en la tabla modelo (insert, delete, udpatinf)
create or replace trigger t_dml_modelo
    instead of insert or update or delete on modelo
declare
    v_count number;
begin
    case
        when inserting then
            v_count := 0;
            -- replica total
                --Replica 1
                insert into modelo_r1(modelo_id, clave, descripcion, activo, marca_id)
                values (:new.modelo_id, :new.clave, :new.descripcion, :new.activo, :new.marca_id);
                v_count := v_count + sql%rowcount;
                -- Replica 2
                insert into modelo_r2(modelo_id, clave, descripcion, activo, marca_id)
                values (:new.modelo_id, :new.clave, :new.descripcion, :new.activo, :new.marca_id);
                ---Conteo de registros cambiados
                v_count := v_count + sql%rowcount;
                -- replica 3
                insert into modelo_r3(modelo_id, clave, descripcion, activo, marca_id)
                values (:new.modelo_id, :new.clave, :new.descripcion, :new.activo, :new.marca_id);
                v_count := v_count + sql%rowcount;
                -- replica 4
                insert into modelo_r4(modelo_id, clave, descripcion, activo, marca_id)
                values (:new.modelo_id, :new.clave, :new.descripcion, :new.activo, :new.marca_id);
                v_count := v_count + sql%rowcount;
                ----Error
                if v_count <> 4 then
                    raise_application_error(-20040,
                    'Error en el num registros de la tabla replicada');
                end if;

        when deleting then
            v_count := 0;
            -- replica local
            --Replica 1
            delete from modelo_r1 where modelo_id = :old.modelo_id;
            v_count := v_count + sql%rowcount;
            -- Replica 2
            delete from modelo_r2 where modelo_id = :old.modelo_id;
            v_count := v_count + sql%rowcount;
            -- Replica 3
            delete from modelo_r3 where modelo_id = :old.modelo_id;
            v_count := v_count + sql%rowcount;
            -- Replica 4
            delete from modelo_r4 where modelo_id = :old.modelo_id;
            v_count := v_count + sql%rowcount;
            ---Error
            if v_count <> 4 then
                raise_application_error(-20040,'Error en el num registros de la tabla replicada');
            end if;
        when updating then
            v_count := 0;
            --replica total
            --Replica 1
            update modelo_r1 set clave = :new.clave, descripcion = :new.descripcion, activo = :new.activo, marca_id = :new.marca_id
            where modelo_id = :new.modelo_id;
            ---Conteo de registros
            v_count := v_count + sql%rowcount;
            -- replica 2
            update modelo_r2 set clave = :new.clave, descripcion = :new.descripcion, activo = :new.activo, marca_id = :new.marca_id
            where modelo_id = :new.modelo_id;
            ---Conteo de registros
            v_count := v_count + sql%rowcount;
            -- replica 3
            update modelo_r3 set clave = :new.clave, descripcion = :new.descripcion, activo = :new.activo, marca_id = :new.marca_id
            where modelo_id = :new.modelo_id;
            ---Conteo de registros            
            v_count := v_count + sql%rowcount;
            -- replica 4
            update modelo_r4 set clave = :new.clave, descripcion = :new.descripcion, activo = :new.activo, marca_id = :new.marca_id
            where modelo_id = :new.modelo_id;
            v_count := v_count + sql%rowcount;
            if v_count <> 4 then
                raise_application_error(-20040,
                'Error en el num registros de la tabla replicada');
            end if;
    end case;
end;
/
show errors
