CREATE OR REPLACE PROCEDURE borrar_si_existe(name IN varchar2)
IS
        n_count NUMBER;
    BEGIN 
    SELECT COUNT(*) INTO n_count FROM all_tables WHERE table_name = name;
    IF (n_count > 0) THEN
        DBMS_OUTPUT.PUT_LINE('La tabla ' || name || 'ya existe y se borrara');
        EXECUTE IMMEDIATE 'DROP TABLE ' || name || ' CASCADE CONSTRAINTS';
    ELSE
        DBMS_OUTPUT.PUT_LINE('La tabla ' || name || 'no existe');
    END IF;
END;
/

DECLARE  
    /*tablas del segmento 1*/
    v_tabla1 varchar2(100) := 'F_HGCG_ARTICULO_2';
    v_tabla2 varchar2(100) := 'F_HGCG_REVISTA_1';
    v_tabla3 varchar2(100) := 'F_HGCG_SUSCRIPTOR_1';
    v_tabla4 varchar2(100) := 'CREATE TABLE F_HGCG_PAGO_SUSCRIPTOR_1';
    v_tabla5 varchar2(100) := 'F_HGCG_PAIS_1';
    v_tabla6 varchar2(100) := 'F_HGCG_SUSCRIPTOR_2';
    v_tabla7 varchar2(100) := 'F_HGCG_ARTICULO_REVISTA_1';
    v_tabla8 varchar2(100) := 'F_HGCG_PAGO_SUSCRIPTOR_1';
    /*tablas del segmento 2*/
    v_tabla12 varchar2(100) := 'F_HGCG_PAGO_SUSCRIPTOR_2';
    v_tabla13 varchar2(100) := 'F_HGCG_REVISTA_2';
    v_tabla14 varchar2(100) := 'F_HGCG_ARTICULO_1';
    v_tabla15 varchar2(100) := 'F_HGCG_ARTICULO_REVISTA_2';
    v_tabla16 varchar2(100) := 'F_HGCG_PAIS_2';
    v_tabla17 varchar2(100) := 'F_HGCG_SUSCRIPTOR_4';


BEGIN 
    /*Tablas del segmento 1*/
    borrar_si_existe(v_tabla1);
    borrar_si_existe(v_tabla2);
    borrar_si_existe(v_tabla3);
    borrar_si_existe(v_tabla4);    
    borrar_si_existe(v_tabla5);
    borrar_si_existe(v_tabla6);
    borrar_si_existe(v_tabla7);
    borrar_si_existe(v_tabla8);
    /*Tablas del segmento 2*/
    borrar_si_existe(v_tabla12);
    borrar_si_existe(v_tabla13);
    borrar_si_existe(v_tabla14);
    borrar_si_existe(v_tabla15);
    borrar_si_existe(v_tabla16);
    borrar_si_existe(v_tabla17);
END;
/
