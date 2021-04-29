--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      23/01/2021
--@Descripcion:         Creacion de TRigger para Pago Ssucriptor en n1

CREATE OR REPLACE TRIGGER t_dml_pago_suscriptor
INSTEAD OF INSERT OR UPDATE OR DELETE ON pago_suscriptor
DECLARE
    v_count number;
BEGIN
    CASE
    ------------------------------------------------------------------------------
    WHEN inserting THEN
    ----Comprobamos en donde se esta insertando 
        ---En este caso es local
        if :new.num_pago >= 1 and :new.num_pago <=60 THEN
            insert into pago_suscriptor_1(suscriptor_id, num_pago, fecha_pago, importe, recibo_pago)
            values(:new.suscriptor_id, :new.num_pago, :new.fecha_pago, :new.importe, :new.recibo_pago);
        ---En este caso es remoto
        elsif :new.num_pago >60 THEN
        ---USando la tabla temporal (manejo de Blobls)
            insert into t_pago_suscriptor_insert(num_pago, suscriptor_id, fecha_pago, importe, recibo_pago)
            values(:new.num_pago, :new.suscriptor_id, :new.fecha_pago, :new.importe, :new.recibo_pago);
            ---- insertamos de la tabla temporal a la tabla original(usando el sinonimo)
            insert into pago_suscriptor_2
                select * from t_pago_suscriptor_insert
                    where num_pago = :new.num_pago and suscriptor_id = :new.suscriptor_id;
            ---- Borramos los registros de la tabla temporal
            delete from t_pago_suscriptor_insert where num_pago = :new.num_pago and suscriptor_id = :new.suscriptor_id;
        else
            raise_application_error(-20001,
            'Error, Valor incorrecto para num_pago' || :new.num_pago
            );
        end if;
    ------------------------------------------------------------------------------
    WHEN deleting THEN
    ----Comprobamos en donde se esta eliminando
        ---En este caso es local
        if :old.num_pago >= 1 and :old.num_pago <=60 THEN    
            delete from  pago_suscriptor_1 WHERE num_pago = :old.num_pago and suscriptor_id = :old.suscriptor_id;
        ---En este caso es remoto
        elsif :old.num_pago >60 THEN
            delete from  pago_suscriptor_2 WHERE num_pago = :old.num_pago and suscriptor_id = :old.suscriptor_id;
        else
            raise_application_error(-20001,
            'Error, Valor incorrecto para num_pago' || :new.num_pago
            );
        end if;                              
    ------------------------------------------------------------------------------    
    ------------------------------------------------------------------------------
    WHEN updating THEN
            raise_application_error(-20002,
            'Error, la setencia UPDATE aun no está implennetadoa'
            );    
    ------------------------------------------------------------------------------    
    END CASE;
END;
/
show errors;    