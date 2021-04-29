--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      20/01/2021
--@Descripcion:         Creacion de Trigger de tipo Instead Of para DML para Suscriptor en PDB 2

--Suscriptor 2
CREATE OR REPLACE TRIGGER t_dml_suscriptor
INSTEAD OF INSERT OR UPDATE OR DELETE ON suscriptor
DECLARE
    v_count NUMBER;
BEGIN
    CASE
        WHEN inserting THEN
        --Primero se verifica si hay correspondecia local para evitar acceso remoto
            select count(*) into v_count from pais_2
            where pais_id =: new.pais_id;
        ------------
            if v_count > 0 THEN
                if substr(:new.ap_paterno, 1, 1) BETWEEN 'A' and 'M' THEN
                    insert into suscriptor_3(suscriptor_id, nombre, ap_paterno, ap_materno, fecha_inscripcion, pais_id)
                    values(:new.suscriptor_id, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_inscripcion, :new.pais_id);
                elsif substr(:new.ap_paterno, 1, 1) BETWEEN 'N' and 'Z' THEN
                    insert into suscriptor_4(suscriptor_id, nombre, ap_paterno, ap_materno, fecha_inscripcion, pais_id)
                    values(:new.suscriptor_id, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_inscripcion, :new.pais_id);
                ELSE
                    raise_application_error(-20001,
                    'Error '
                    || :new.ap_paterno
                    );
                END IF;
            ELSE
        ----------- Comprobar si hay columnas
                select count(*) into v_count from pais_1
                where pais_id =: new.pais_id;
                --Insercion Local
                if v_count > 0 THEN
                    insert into suscriptor_2(suscriptor_id, nombre, ap_paterno, ap_materno, fecha_inscripcion, pais_id)
                    values(:new.suscriptor_id, :new.nombre, :new.ap_paterno, :new.ap_materno, :new.fecha_inscripcion, :new.pais_id);
                ELSE
                    raise_application_error(-20001,
                    'Error de integridad para el campo pais_id: '
                    || :new.pais_id
                    || ' Registro no encontrado en el fragmento'
                    );
                END IF;  
            end if;
        ----Pase lo que pase siempre se debe insertar en el fragmento de suscriptor_1
        ----Ya que este es de tipo "Vertical"
        insert into suscriptor_1(suscriptor_id, num_tarjeta)
        VALUES(:new.suscriptor_id, :new.num_tarjeta);
        ---Caso de borrar
        WHEN deleting THEN
            select count(*) into v_count from pais_2
            where pais_id =: old.pais_id;
            if v_count > 0 THEN
                --Verificacion de fragmentacion horizontal
                if substr(:old.ap_paterno, 1, 1) BETWEEN 'A' and 'M' THEN
                    delete from suscriptor_3 WHERE suscriptor_id = :old.suscriptor_id;
                elsif substr(:old.ap_paterno, 1, 1) BETWEEN 'N' and 'Z' THEN
                    delete from suscriptor_4 WHERE suscriptor_id = :old.suscriptor_id;
                ELSE
                    raise_application_error(-20001,
                        'Valor incorrecto para el campo apellido paterno');
                end if;
            else
                --SELECT COUNT(*) INTO v_count from pais_1
                --where pais_id = :old.pais_id;
                --if v_count >0 THEN
                    DELETE from suscriptor_2
                    WHERE suscriptor_id = :old.suscriptor_id;
                --ELSE
                  --  raise_application_error(-20001,
                   --     'error de integridad');
                --end if;                    
            END if;
            --Pase lo que pase, borramos en 1
            DELETE from suscriptor_1 WHERE suscriptor_id = :old.suscriptor_id;        
        ----------------------------------------------------------------------------------------
        WHEN updating THEN
            raise_application_error(-20002,
            'Error, la setencia UPDATE aun no está implennetadoa'
            );
    END CASE;
END;
/