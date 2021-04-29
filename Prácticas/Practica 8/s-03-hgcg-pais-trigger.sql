--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      20/01/2021
--@Descripcion:         Creacion de TRigger para Pais

CREATE OR REPLACE TRIGGER t_dml_pais
INSTEAD OF INSERT OR UPDATE OR DELETE ON pais
DECLARE

BEGIN
    CASE
    ---------------------------------------------------------------------------------------
        ---Para el caso de insertar
        WHEN INSERTING THEN
            ---Comprobando en que fragmento va
            ---Si esta en A, se inserta en el fragmento 1
            IF :new.region_economica like 'A%' THEN
                INSERT INTO pais_1(pais_id, clave, nombre, region_economica)
                VALUES(:new.pais_id, :new.clave, :new.nombre, :new.region_economica);
            ---Si esta en B, se inserta en el fragmento 2
            elsif :new.region_economica like 'B%' THEN
                INSERT INTO pais_2(pais_id, clave, nombre, region_economica)
                VALUES(:new.pais_id, :new.clave, :new.nombre, :new.region_economica);
            ELSE
			    raise_application_error(-20001, 'El campo de region economica no es valido ' 
                || :new.region_economica
                || ' Debe ser A o B'
                );
            END IF;
    ---------------------------------------------------------------------------------------            
        ---Para el caso de Eliminar
        WHEN DELETING THEN
            IF upper(:old.region_economica) LIKE 'A%' THEN
                DELETE FROM pais_1 WHERE pais_id = :old.pais_id;
            elsif upper(:old.region_economica) LIKE 'B%' THEN
                DELETE FROM pais_2 WHERE pais_id = :old.pais_id;
            ELSE
			    raise_application_error(-20001, 'Error->'
                || :old.region_economica ||'<-');
            END IF;
    ---------------------------------------------------------------------------------------            
        --Para el caso de Atualizar
        WHEN UPDATING THEN
            ---- Para el caso de A a A (Fragmento 1)
            IF :new.region_economica LIKE 'A%' AND :old.region_economica LIKE 'A%' THEN
                UPDATE pais_1 SET pais_id = :new.pais_id,
                clave=:new.clave, nombre =:new.nombre, region_economica =:new.region_economica
                WHERE pais_id =:old.pais_id;
            ---- Para el caso de A a A (Fragmento 1)                
            elsif :new.region_economica LIKE 'B%' AND :old.region_economica LIKE 'B%' THEN
                UPDATE pais_2 SET pais_id = :new.pais_id,
                clave=:new.clave, nombre =:new.nombre, region_economica =:new.region_economica
                WHERE pais_id =:old.pais_id;
            ---- Para el caso de B a A (Fragmento 2 a Fragmento 1)
            elsif :new.region_economica like 'B%' AND :old.region_economica like 'A%' THEN
                ---Insertando el registro en El fratmento 2
                INSERT INTO pais_2(pais_id, clave, nombre, region_economica)
                VALUES(:new.pais_id, :new.clave, :new.nombre, :new.region_economica);
                ---- Eliminamos el registro anterior (Fragmento 1)
                DELETE FROM pais_1 WHERE pais_id = :old.pais_id;
            ---- Para el caso de A a B (Fragmento 1 a Fragmento 2)
            elsif :new.region_economica LIKE 'A%' AND :old.region_economica LIKE 'B%' THEN
                ---Insertando el registro en El fratmento 1
                INSERT INTO pais_1(pais_id, clave, nombre, region_economica)
                VALUES(:new.pais_id, :new.clave, :new.nombre, :new.region_economica);
                ---- Eliminamos el registro anterior (Fragmento 2)
                DELETE FROM pais_2 WHERE pais_id = :old.pais_id;                
            ELSE
			    raise_application_error(-20001, 'El campo de region economica no es valido ' 
                || :new.region_economica
                || ' Debe ser A o B'
                );
            end if;
    ---------------------------------------------------------------------------------------
    END CASE;
END;
/
show errors;