--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/01/2021
--@Descripcion:         Definicion de las vistas

------------------------------------
-----Vista de Pais
CREATE OR REPLACE VIEW pais AS
    SELECT pais_id, clave, nombre, region_economica
    FROM pais_2
    UNION ALL
    SELECT pais_id, clave, nombre, region_economica
    FROM pais_1;
prompt Vista de Pais
SELECT count(*) FROM pais;

------------------------------------
------------------- Poner con Blob --------------------
------Vista de Articulo S2
CREATE OR REPLACE VIEW articulo_e1 AS
    SELECT articulo_id FROM articulo_1;

CREATE OR REPLACE VIEW articulo_e2 AS
    SELECT articulo_id, titulo, texto FROM articulo_2;
/*

prompt Vista de Pais
select count(*) from articulo;
*/
-----------------------------------
-----Vista de Revistas
CREATE OR REPLACE VIEW revista AS
    SELECT revista_id, folio, titulo, fecha_publicacion, revista_adicional_id
        FROM revista_1
    UNION ALL
    SELECT revista_id, folio, titulo, fecha_publicacion, revista_adicional_id
        FROM revista_2;

prompt Vista de Revista        
select count(*) from revista;

----------------------------------
-----Vista de Articulos Revista
CREATE OR REPLACE VIEW articulo_revista AS
    SELECT articulo_revista_id, articulo_id, revista_id, fecha_aprobacion, calificacion
        FROM articulo_revista_1
    UNION ALL
    SELECT articulo_revista_id, articulo_id, revista_id, fecha_aprobacion, calificacion
        FROM articulo_revista_2;

prompt Vista de articulo_revista
SELECT COUNT(*) FROM articulo_revista;

----------------------------------
------Poner el Blob en pago_suscriptor
----Pago Suscriptor
-----------------------------Esquema de Fragmentacion Horizontal 

CREATE OR REPLACE VIEW pago_suscriptor_e1 AS
    SELECT suscriptor_id, num_pago, fecha_pago, importe
        FROM PAGO_SUSCRIPTOR_1;
        
CREATE OR REPLACE VIEW pago_suscriptors_e2 as
    SELECT suscriptor_id, num_pago, fecha_pago, importe 
        FROM PAGO_SUSCRIPTOR_2;

--prompt Vista Pago_suscriptor
--select count(*) from pago_suscriptor;

---------------------------------
----- Suscriptores
CREATE OR REPLACE VIEW suscriptor AS
    SELECT s1.suscriptor_id, s2.nombre, s2.ap_paterno, s2.ap_materno, s2.fecha_inscripcion, s2.pais_id, s1.num_tarjeta
    from SUSCRIPTOR_1 s1
        JOIN(
            select SUSCRIPTOR_ID, nombre, ap_paterno, ap_materno, fecha_inscripcion, pais_id
            from SUSCRIPTOR_2 
                union all   
            select SUSCRIPTOR_ID, nombre, ap_paterno, ap_materno, fecha_inscripcion, pais_id
            from SUSCRIPTOR_3   
                union all
            select SUSCRIPTOR_ID, nombre, ap_paterno, ap_materno, fecha_inscripcion, pais_id
            from SUSCRIPTOR_4
        )s2
        ON s1.suscriptor_id = s2.suscriptor_id;

prompt Vista suscriptor
SELECT count(*) from suscriptor;
commit;