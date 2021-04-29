--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      23/01/2021
--@Descripcion:         Creacion de TRigger para articulor en n2

CREATE OR REPLACE TRIGGER t_dml_articulo
INSTEAD OF INSERT OR UPDATE OR DELETE ON articulo
DECLARE

BEGIN
    CASE
    -----------------------------------------------------------------------
    WHEN inserting THEN
        --- Insertamos localmente a la tabla articulo_1 que contiene el pdf
        insert into articulo_1(articulo_id, pdf)
        VALUES(:new.articulo_id, :new.pdf);
        ---Hacemos la insercion remotamente en s2
        insert into articulo_2(articulo_id, titulo, resumen, texto)
        VALUES(:new.articulo_id, :new.titulo, :new.resumen, :new.texto);
    -----------------------------------------------------------------------
    WHEN deleting THEN
        DELETE FROM articulo_1 WHERE articulo_id = :old.articulo_id;
        DELETE FROM articulo_2 WHERE articulo_id = :old.articulo_id;
    ----------------------------------------------------------------------
    WHEN updating THEN
            raise_application_error(-20002,
            'Error, la setencia UPDATE aun no está implennetadoa'
            );    
    END CASE;
    --------------------------------------------------------------------------
END;
/
show errors;        