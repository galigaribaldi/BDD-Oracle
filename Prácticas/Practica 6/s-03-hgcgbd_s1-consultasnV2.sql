--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      27/11/2020
--@Descripcion:         Script encargado de realizar consultas para comprobar ligas

prompt conectando a hgcgbd_s1
connect editorial_bdd/gali123@hgcg_s1
prompt realizando conteo de registros
set serveroutput on

--La consulta se lanza en JRCBD_S1
--CREATE OR REPLACE PROCEDURE consulta()
--IS
DECLARE
    v_num_suscriptor number;
    v_nombre number;
    v_ap_paterno number;
    v_ap_materno number;
    v_fecha number;
    v_pais_id number;
    v_num_tarjeta number;
    --completar
    begin
        dbms_output.put_line('Realizando consulta empleando ligas');
        --consultando suscriptor_id
        select count(*) as into v_num_suscriptor
            from (
                select suscriptor_id
                    from F_HGCG_SUSCRIPTOR_1
                union all
                select suscriptor_id
                    from F_HGCG_SUSCRIPTOR_2
                union all
                select suscriptor_id
                    from F_HGCG_SUSCRIPTOR_3
                union all
                select suscriptor_id
                    from F_HGCG_SUSCRIPTOR_4@hgcg_s2.fi.unam
            ) q1;
        --consultando nombre
        select count(*) as into v_nombre
            from (
--                select nombre
--                    from F_HGCG_SUSCRIPTOR_1
--                union all
                select nombre
                    from F_HGCG_SUSCRIPTOR_2
                union all
                select nombre
                    from F_HGCG_SUSCRIPTOR_3
                union all                
                select nombre
                    from F_HGCG_SUSCRIPTOR_4@hgcg_s2.fi.unam
            ) q2;
        --consultando apellido paterno
        select count(*) as into v_ap_paterno
            from (
--                select ap_paterno
--                    from F_HGCG_SUSCRIPTOR_1
--                union all
                select ap_paterno
                    from F_HGCG_SUSCRIPTOR_2
                union all
                select ap_paterno
                    from F_HGCG_SUSCRIPTOR_3
                union all                
                select ap_paterno
                    from F_HGCG_SUSCRIPTOR_4@hgcg_s2.fi.unam
            ) q3;
        --consultando apellido materno
        select count(*) as into v_ap_materno
            from (
--                select ap_materno
--                    from F_HGCG_SUSCRIPTOR_1
--                union all
                select ap_materno
                    from F_HGCG_SUSCRIPTOR_2
                union all
                select ap_materno
                    from F_HGCG_SUSCRIPTOR_3
                union all                
                select ap_materno
                    from F_HGCG_SUSCRIPTOR_4@hgcg_s2.fi.unam
            ) q4;
        --consultando fecha_publicacion
        select count(*) as into v_fecha
            from (
--                select fecha_publicacion
--                    from F_HGCG_SUSCRIPTOR_1
--                union all
                select fecha_publicacion
                    from F_HGCG_SUSCRIPTOR_2
                union all
                select fecha_publicacion
                    from F_HGCG_SUSCRIPTOR_3
                union all                
                select fecha_publicacion
                    from F_HGCG_SUSCRIPTOR_4@hgcg_s2.fi.unam
            ) q5;  
        --consultando pais_id
        select count(*) as into v_pais_id
            from (
--                select pais_id
--                    from F_HGCG_SUSCRIPTOR_1
--                union all
                select pais_id
                    from F_HGCG_SUSCRIPTOR_2
                union all
                select pais_id
                    from F_HGCG_SUSCRIPTOR_3
                union all                
                select pais_id
                    from F_HGCG_SUSCRIPTOR_4@hgcg_s2.fi.unam
            ) q6;
        --consultando NUM_TARJETA
        select count(*) as into v_num_tarjeta
            from (
                select NUM_TARJETA
                    from F_HGCG_SUSCRIPTOR_1
--                union all
--                select NUM_TARJETA
--                    from F_HGCG_SUSCRIPTOR_2
--                union all
--                select NUM_TARJETA
--                    from F_HGCG_SUSCRIPTOR_4@hgcg_s2.fi.unam
            ) q7;                       
        -- realizar el mismo procedimiento para las demás tablas.
        dbms_output.put_line('Resultado del conteo de registros');
        dbms_output.put_line('Suscriptor ID: '||v_num_suscriptor );        
        dbms_output.put_line('Nombre: '||v_nombre );
        dbms_output.put_line('Apellido Paterno: '||v_ap_paterno );
        dbms_output.put_line('Apellido Materno: '||v_ap_materno );
        dbms_output.put_line('Fecha: '||v_fecha );
        dbms_output.put_line('Pais ID: '||v_pais_id );
        dbms_output.put_line('Numero Tarjeta: '||v_num_tarjeta );        
END;
/
--begin
-- consulta();
--end;
--/
Prompt Listo