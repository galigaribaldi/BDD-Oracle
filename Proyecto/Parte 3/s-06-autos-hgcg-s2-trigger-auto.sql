--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en 
---    la tabla auto en hgcg_Sw (insert, delete)
create or replace trigger t_dml_auto
    instead of insert or update or delete on auto
declare
    v_count number;
begin
    case
        ---------------------------------------------------------------------------
        --En el caso de insertar
        ---------------------------------------------------------------------------            
        when inserting then
            ---Localmente 
            select count(*) into v_count
            from sucursal_f2 where sucursal_id = :new.sucursal_id;
            if v_count > 0 THEN
                insert into auto_f2(auto_id, anio, num_serie, tipo, precio, fecha_status, modelo_id, status_auto_id, sucursal_id)
                values(:new.auto_id, :new.anio, :new.num_serie, :new.tipo, :new.precio, :new.fecha_status, :new.modelo_id, :new.status_auto_id, :new.sucursal_id);                    
            else
            ---Remotamente
            select count(*) into v_count
            from sucursal_f1 where sucursal_id = :new.sucursal_id;
            --- insertamos Remotamente
            if v_count > 0 THEN
                insert into auto_f1(auto_id, anio, num_serie, tipo, precio, fecha_status, modelo_id, status_auto_id, sucursal_id)
                values(:new.auto_id, :new.anio, :new.num_serie, :new.tipo, :new.precio, :new.fecha_status, :new.modelo_id, :new.status_auto_id, :new.sucursal_id);            
                else
                    --ERROR
                    raise_application_error(-20020, 'No se encontro el registro padre ');
                end if;
            end if;
            ---Realizamos el insert siempre para framento 3 ya que es un BLOB
            ---HAcemos uso de las tablas temportales
            insert into ti_auto_f3(auto_id,foto) values(:new.auto_id,:new.foto);
            -------
            insert into auto_f3(auto_id,foto)
                select * from ti_auto_f3
                where auto_id = :new.auto_id;
            ----
            delete from ti_auto_f3;
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
        --------------------------------
            select count(*) into v_count 
            from sucursal_f1 where sucursal_id = :old.sucursal_id;
            --
            if v_count > 0 then 
            -- Localmente se elimina
                delete from auto_f1 where auto_id = :old.auto_id;
            else 
                select count(*) into v_count 
                from sucursal_f2 where sucursal_id = :old.sucursal_id;
                -- Remotamente
                if v_count > 0 then 
                    delete from auto_f2 where auto_id = :old.auto_id;
                -- Errro                    
                else 
                    raise_application_error(-20020, 'Registro padre mal');
                end if;
            end if;
        -- Siempre se hace la eliminacion en auto_f3
        delete from auto_f3 where auto_id = :old.auto_id;
        --------------------------------
    end case;
end;
/
show errors;