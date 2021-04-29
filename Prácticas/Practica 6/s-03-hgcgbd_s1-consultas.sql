--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      27/11/2020
--@Descripcion:         Script encargado de realizar consultas para comprobar ligas


prompt conectando a hgcgbd_s1
connect editorial_bdd/gali123@hgcg_s1
prompt Realizando conteo de registros
set serveroutput on
--La consulta se lanza en hgcg_s1
declare
v_num_paises number;
v_num_articulos number;
v_num_suscriptores number;
v_num_revistas  number;
v_num_articulos_revista number;
v_num_pago_suscriptor number;

begin
dbms_output.put_line('Realizando consulta empleando ligas');
---Corregir
select count(*) as into v_num_paises
from (
    select PAIS_ID             
    from F_HGCG_PAIS_1
    union all
    select PAIS_ID             
    from F_HGCG_PAIS_2@hgcg_s2.fi.unam
) q1;
--	Listo!
select count(*) as into v_num_articulos
from (
    select A2.ARTICULO_ID                 
    from F_HGCG_ARTICULO_2 A2 
    JOIN F_HGCG_ARTICULO_1@hgcg_s2.fi.unam A1
    ON A1.ARTICULO_ID=A2.ARTICULO_ID
) q1;

--	Corregir
select count(*) as into v_num_revistas
from (
    select REVISTA_ID                               
    from F_HGCG_REVISTA_1 
    union all
    select REVISTA_ID             
    from F_HGCG_REVISTA_2@hgcg_s2.fi.unam
) q1;

-----------------Corregir------------
select count(*) as into v_num_articulos_revista 
from (
    select ARTICULO_REVISTA_ID                                   
    from F_HGCG_ARTICULO_REVISTA_1  
    union all
    select ARTICULO_REVISTA_ID                                   
    from F_HGCG_ARTICULO_REVISTA_2@hgcg_s2.fi.unam
) q1;

---------Listo
select count(*) as into v_num_pago_suscriptor 
from (
    select SUSCRIPTOR_ID                                       
    from F_HGCG_PAGO_SUSCRIPTOR_1  
    union all
    select SUSCRIPTOR_ID                                       
    from F_HGCG_PAGO_SUSCRIPTOR_2@hgcg_s2.fi.unam
) q1;

-----	Corregir
select count(*) as into v_num_suscriptores 
from (
    select s1.SUSCRIPTOR_ID from F_HGCG_SUSCRIPTOR_1 s1 
    JOIN(
        select SUSCRIPTOR_ID                                       
        from F_HGCG_SUSCRIPTOR_2 
        union all   
        select SUSCRIPTOR_ID                                       
        from F_HGCG_SUSCRIPTOR_3   
        union all
        select SUSCRIPTOR_ID                                       
        from F_HGCG_SUSCRIPTOR_4@hgcg_s2.fi.unam
    )q2 
    on s1.SUSCRIPTOR_ID=q2.SUSCRIPTOR_ID
) 
 q1;


-- Impresión de los resultados
dbms_output.put_line('Realizando conteo de registros:');
dbms_output.put_line('==================================');
dbms_output.put_line('Paises: ' || (v_num_paises-2));
dbms_output.put_line('Suscriptores: ' || (v_num_suscriptores-6));
dbms_output.put_line('Articulos: ' || (v_num_articulos));
dbms_output.put_line('Revistas: ' || (v_num_revistas-2));
dbms_output.put_line('Articulo Revista: ' || (v_num_articulos_revista-2));
dbms_output.put_line('Pago suscriptor: ' || v_num_pago_suscriptor);

end;
/

prompt Listo

exit