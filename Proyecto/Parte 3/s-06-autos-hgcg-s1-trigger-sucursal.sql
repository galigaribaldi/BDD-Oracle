--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en 
---    la tabla sucursal en hgcg_S1 (insert, delete)
create or replace trigger t_dml_sucursal
    instead of insert or update or delete on sucursal
declare
    v_count number;
begin
    case
        ---------------------------------------------------------------------------
        --En el caso de insertar
        ---------------------------------------------------------------------------            
        when inserting then
        ---Condicion para inserar en la clave
            if :new.clave != '0000' then
                --Verificar si es local
                select count(*) into v_count
                from pais_f1 where pais_id = :new.pais_id;
                ---Si es local inserta
                if v_count > 0 THEN
                    --Localmente en sucursal_f1
                    insert into sucursal_f1(sucursal_id, nombre, clave, sucursal_anexa_id, pais_id)
                    values(:new.sucursal_id, :new.nombre, :new.clave, :new.sucursal_anexa_id, :new.pais_id);
                else
                    select count(*) into v_count
                    from pais_f2 where pais_id = :new.pais_id;
                    --Remotamente en sucursal_f2
                    if v_count > 0 THEN
                        insert into sucursal_f2(sucursal_id, nombre, clave, sucursal_anexa_id, pais_id)
                        values(:new.sucursal_id, :new.nombre, :new.clave, :new.sucursal_anexa_id, :new.pais_id);                    
                    ELSE
                        --Error criterio
                        raise_application_error(-20020,'Eror en la tabla padre fragmento');
                    end if;
                end if;
            ELSIF :new.clave = '0000' THEN
                ---Directamente a Sucursal F3
                insert into sucursal_f3(sucursal_id, nombre, clave, sucursal_anexa_id, pais_id)
                values(:new.sucursal_id, :new.nombre, :new.clave, :new.sucursal_anexa_id, :new.pais_id);
            ---Error
            else
                raise_application_error(-20010,'Error!');
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
            ------------------------------
            if :old.clave != '00000' then
                -- Si es local
                -----------------------------------------
                select count(*) into v_count 
                from pais_f1 where pais_id = :old.pais_id;
                -----------------------------------------
                if v_count > 0 then 
                    delete from sucursal_f1 where sucursal_id = :old.sucursal_id;
                else 
                    -- Verificar Si es remoto
                    select count(*) into v_count 
                    from pais_f2 where pais_id = :old.pais_id;
                    -- Si si lo es, lo hacemos remotamente
                    if v_count > 0 then 
                        delete from sucursal_f2 where sucursal_id = :old.sucursal_id;
                    else 
                    -- Error
                        raise_application_error(-20020,'Error en el registro padre');
                    end if;
                end if;

            elsif :old.clave = '00000' then
                -- eliminar en sucursal_f3
                delete from sucursal_f3 where sucursal_id = :old.sucursal_id;
            else 
                -- Error 
                raise_application_error(-20010,'Error!');
            end if;
    end case;
end;
/
show errors;