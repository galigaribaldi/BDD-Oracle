--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      23/01/2021
--@Descripcion:         Creacion de TRigger para articulo en n1

CREATE OR REPLACE TRIGGER t_dml_articulo
INSTEAD OF INSERT OR UPDATE OR DELETE ON articulo
DECLARE

BEGIN
    CASE
    -----------------------------------------------------------------------
    WHEN inserting THEN
        ---HAcemos uso de la tabla temportal e insertamos el valor remotamente en S2
        ---Esto debido al tipo de fragmentación vertical que tiene
        INSERT INTO t_articulo_insert(articulo_id, pdf)
        VALUES(:new.articulo_id, :new.pdf);
        insert into articulo_1
            select * from t_articulo_insert
            WHERE articulo_id = :new.articulo_id;
        ----Borramos de la tabla temportal
        DELETE FROM t_articulo_insert WHERE articulo_id = :new.articulo_id;
        ---Hacemos la insercion localmente en s1
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