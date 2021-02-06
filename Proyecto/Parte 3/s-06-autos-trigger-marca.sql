--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en la tabla marca (insert, delete), updating
create or replace trigger t_dml_marca
    instead of insert or update or delete on marca
declare
    v_count number;
begin
    case
        when inserting then
            v_count := 0;
            -- replica total
                --Replica 1
                insert into marca_r1(marca_id, clave, activo, descripcion)
                values (:new.marca_id, :new.clave, :new.activo, :new.descripcion);
                v_count := v_count + sql%rowcount;
                -- Replica 2
                insert into marca_r2(marca_id, clave, activo, descripcion)
                values (:new.marca_id, :new.clave, :new.activo, :new.descripcion);
                ---Conteo de registros cambiados
                v_count := v_count + sql%rowcount;
                -- replica 3
                insert into marca_r3(marca_id, clave, activo, descripcion)
                values (:new.marca_id, :new.clave, :new.activo, :new.descripcion);
                v_count := v_count + sql%rowcount;
                -- replica 4
                insert into marca_r4(marca_id, clave, activo, descripcion)
                values (:new.marca_id, :new.clave, :new.activo, :new.descripcion);
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
            delete from marca_r1 where marca_id = :old.marca_id;
            v_count := v_count + sql%rowcount;
            -- Replica 2
            delete from marca_r2 where marca_id = :old.marca_id;
            v_count := v_count + sql%rowcount;
            -- Replica 3
            delete from marca_r3 where marca_id = :old.marca_id;
            v_count := v_count + sql%rowcount;
            -- Replica 4
            delete from marca_r4 where marca_id = :old.marca_id;
            v_count := v_count + sql%rowcount;
            ---Error
            if v_count <> 4 then
                raise_application_error(-20040,'Error en el num registros de la tabla replicada');
            end if;
        when updating then
            v_count := 0;
            --replica total
            --Replica 1
            update marca_r1 set clave = :new.clave, descripcion = :new.descripcion, activo = :new.activo
            where marca_id = :new.marca_id;
            ---Conteo de registros
            v_count := v_count + sql%rowcount;
            -- replica 2
            update marca_r2 set clave = :new.clave, descripcion = :new.descripcion, activo = :new.activo
            where marca_id = :new.marca_id;
            ---Conteo de registros
            v_count := v_count + sql%rowcount;
            -- replica 3
            update marca_r3 set clave = :new.clave, descripcion = :new.descripcion, activo = :new.activo
            where marca_id = :new.marca_id;
            ---Conteo de registros            
            v_count := v_count + sql%rowcount;
            -- replica 4
            update marca_r4 set clave = :new.clave, descripcion = :new.descripcion, activo = :new.activo
            where marca_id = :new.marca_id;
            v_count := v_count + sql%rowcount;
            if v_count <> 4 then
                raise_application_error(-20040,
                'Error en el num registros de la tabla replicada');
            end if;
    end case;
end;
/
show errors
