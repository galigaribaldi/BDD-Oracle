--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      10/11/2020
--@Descripcion:         Consulta ddatos

prompt Conectando a S1 - hgcg S1
connect editorial_bdd/gali123@hgcg_s1
COL articulo2 FORMAT A30;
COL revista1 FORMAT A30;
COL articuloRev1 FORMAT A30;
COL suscriptor1 FORMAT A30;
COL pagoSuscriptor1 FORMAT A30;
COL pais1 FORMAT A30;
COL suscriptor2 FORMAT A30;
set linesize 200;

prompt Segmento 1
select (SELECT COUNT(*) FROM F_HGCG_ARTICULO_2) AS Articulo_2,
		(SELECT COUNT(*) FROM F_HGCG_REVISTA_1) as Revista_1,
		(SELECT COUNT(*) FROM F_HGCG_ARTICULO_REVISTA_1) as Articulo_Revista_1,
		(SELECT COUNT(*) FROM F_HGCG_SUSCRIPTOR_1) as Suscriptor_1,
		(SELECT COUNT(*) FROM F_HGCG_PAGO_SUSCRIPTOR_1) as Pago_Suscriptor_1,
		(SELECT COUNT(*) FROM F_HGCG_PAIS_1) as Pais_1,		
		(SELECT COUNT(*) FROM F_HGCG_SUSCRIPTOR_2) as Suscriptor_2
		FROM DUAL;

prompt Conectando a S2 - hgcg S2
connect editorial_bdd/gali123@hgcg_s2

PROMPT Segmento 2

select (SELECT COUNT(*) FROM F_HGCG_PAGO_SUSCRIPTOR_2) AS Suscripcion_Pago_2,
		(SELECT COUNT(*) FROM F_HGCG_REVISTA_2) as Revista_2,
		(SELECT COUNT(*) FROM F_HGCG_ARTICULO_1) as Articulo_1,
		(SELECT COUNT(*) FROM F_HGCG_ARTICULO_REVISTA_2) as Articulo_Revista_2,
		(SELECT COUNT(*) FROM F_HGCG_PAIS_2) as Pais_2,
		(SELECT COUNT(*) FROM F_HGCG_SUSCRIPTOR_4) as Suscripcion_4
		FROM DUAL;
