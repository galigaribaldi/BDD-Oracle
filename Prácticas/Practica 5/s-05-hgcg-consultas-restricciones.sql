--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      10/11/2020
--@Descripcion:         Consulta de restricciones Código de la vista


COL tipo_rest FORMAT A30;
COL nombre_restriccion_ref FORMAT A30;
COL tabla_padre FORMAT A30;
COL tabla_hija FORMAT A30;
set linesize 200;

DROP TABLE VIESTA;

CREATE TABLE VIESTA AS(
select c.constraint_type as tipo_rest, 
        c.r_constraint_name as nombre_restriccion_ref, 
        p.table_name as tabla_padre,
        c.table_name as tabla_hija
    from user_constraints c 
    join user_constraints p on p.constraint_name  = c.r_constraint_name
    where c.constraint_type = 'R');
SELECT * FROM VIESTA;