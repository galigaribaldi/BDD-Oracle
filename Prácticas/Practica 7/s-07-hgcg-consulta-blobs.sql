--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      15/01/2021
--@Descripcion:         Scripts para valida vistas con columnas BLOB

prompt conectandose a hgcg_s1
connect editorial_bdd/gali123@hgcg_s1

prompt para articulo 1
select articulo_id, pdf as longitud from articulo_1_e1;

prompt para recibo Pago
select suscriptor_id, dbms_lob.getlength(recibo_pago) from pago_suscriptor_2_e1;

prompt usando Sinonumo
select articulo_id, pdf as longitud from articulo;
select suscriptor_id, dbms_lob.getlength(recibo_pago) from pago_suscriptor;
------------------------------------------------------------------------------------

prompt conectandose a hgcg_s2
connect editorial_bdd/gali123@hgcg_s2

prompt para articulo 1 (no necesario sinonimo)
select articulo_id, pdf as longitud from articulo;
select suscriptor_id, dbms_lob.getlength(recibo_pago) from pago_suscriptor;