--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   05/02/2021
--@Descripcion:         Instead of trigger empleado para implementar DML en 
---    la tabla auto particular en hgcg_S2 (insert, delete)
create or replace trigger t_dml_auto_particular
    instead of insert or update or delete on auto_particular
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
            and upper(tipo) = 'P';
            if v_count > 0 THEN
                insert into auto_particular_f2(auto_id, num_cilindros, num_pasajeros, clase)
                values(:new.auto_id, :new.num_cilindros, :new.num_pasajeros, :new.clase);            
            else
            --------------------------------------
                select count(*) into v_count
                from auto_f1 where auto_id = :new.auto_id
                and upper(tipo) = 'P';
                --- insertamos Remotamente
                if v_count > 0 THEN
                    insert into auto_particular_f1(auto_id, num_cilindros, num_pasajeros, clase)
                    values(:new.auto_id, :new.num_cilindros, :new.num_pasajeros, :new.clase);
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
            from auto_particular_f2 where auto_id = :old.auto_id;
            --
            if v_count > 0 then 
            -- Localmente se elimina
                delete from auto_particular_f2 where auto_id = :old.auto_id;
            else 
                -- Remotamente
                delete from auto_particular_f1 where auto_id = :old.auto_id;
            end if;
        --------------------------------
    end case;
end;
/
show errors;