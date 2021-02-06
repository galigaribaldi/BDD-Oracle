--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en 
---    la tabla auto carga en hgcg_S2 (insert, delete)
create or replace trigger t_dml_auto_carga
    instead of insert or update or delete on auto_carga
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
            from auto_f2 where auto_id = :new.auto_id
            and upper(tipo) = 'C';
            if v_count > 0 THEN
                insert into auto_carga_f2(auto_id, peso_maximo, volumen, tipo_consumible)
                values(:new.auto_id, :new.peso_maximo, :new.volumen, :new.tipo_consumible);            
            else
            ------------   
            select count(*) into v_count
            from auto_f1 where auto_id = :new.auto_id
            and upper(tipo) = 'C';
            --- insertamos Remotamente
            if v_count > 0 THEN
                insert into auto_carga_f1(auto_id, peso_maximo, volumen, tipo_consumible)
                values(:new.auto_id, :new.peso_maximo, :new.volumen, :new.tipo_consumible);
                else
                    --ERROR
                    raise_application_error(-20020, 'No se encontro el registro padre ');
                end if;    
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
        --------------------------------
            select count(*) into v_count 
            from auto_carga_f2 where auto_id = :old.auto_id;
            --
            if v_count > 0 then 
            -- Localmente se elimina
                delete from auto_carga_f2 where auto_id = :old.auto_id;
            else 
                -- Remotamente
                delete from auto_carga_f1 where auto_id = :old.auto_id;
            end if;
        --------------------------------
    end case;
end;
/
show errors;