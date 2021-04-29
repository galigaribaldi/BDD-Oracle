--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/01/2021
--@Descripcion:         Creación de sinonimos

prompt creación de sinonimos

prompt Concectandose a hgcg_s1
connect editorial_bdd/gali123@hgcg_s1

prompt Creando sinonimos en hgcg_s1

prompt Creand sinonimos para Pais 1 y 2
create or replace synonym pais_1 for f_hgcg_pais_1;
create or replace synonym pais_2 for f_hgcg_pais_2@hgcg_s2;

prompt Creando sinonimos para Suscriptor 1, 2, 3
create or replace synonym suscriptor_1 for f_hgcg_suscriptor_1;
create or replace synonym suscriptor_2 for f_hgcg_suscriptor_2;
create or replace synonym suscriptor_3 for f_hgcg_suscriptor_3;
create or replace synonym suscriptor_4 for f_hgcg_suscriptor_4@hgcg_s2;

prompt Creando sinonimos para Revista
create or replace synonym revista_1 for f_hgcg_revista_1;
create or replace synonym revista_2 for f_hgcg_revista_2@hgcg_s2;

prompt Creando sinonimos para Articulo
create or replace synonym articulo_2 for f_hgcg_articulo_2;
create or replace synonym articulo_1 for f_hgcg_articulo_1@hgcg_s2;

prompt Creando Sinonimos par aArituclo Revista
create or replace synonym articulo_revista_1 for f_hgcg_articulo_revista_1;
create or replace synonym articulo_revista_2 for f_hgcg_articulo_revista_2@hgcg_s2;

prompt Creando sinonimos para Pago Suscriptor
create or replace synonym pago_suscriptor_1 for f_hgcg_pago_suscriptor_1;
create or replace synonym pago_suscriptor_2 for f_hgcg_pago_suscriptor_2@hgcg_s2;

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
prompt Concectandose a hgcg_s2
connect editorial_bdd/gali123@hgcg_s2

prompt Creando sinonimos en hgcg_s2

prompt Creand sinonimos para Pais 1 y 2
create or replace synonym pais_1 for f_hgcg_pais_1@hgcg_s1;
create or replace synonym pais_2 for f_hgcg_pais_2;

prompt Creando sinonimos para Suscriptor 1, 2, 3
create or replace synonym suscriptor_1 for f_hgcg_suscriptor_1@hgcg_s1;
create or replace synonym suscriptor_2 for f_hgcg_suscriptor_2@hgcg_s1;
create or replace synonym suscriptor_3 for f_hgcg_suscriptor_3@hgcg_s1;
create or replace synonym suscriptor_4 for f_hgcg_suscriptor_4;

prompt Creando sinonimos para Revista
create or replace synonym revista_1 for f_hgcg_revista_1@hgcg_s1;
create or replace synonym revista_2 for f_hgcg_revista_2;

prompt Creando sinonimos para Articulo
create or replace synonym articulo_2 for f_hgcg_articulo_2@hgcg_s1;
create or replace synonym articulo_1 for f_hgcg_articulo_1;

prompt Creando Sinonimos par aArituclo Revista
create or replace synonym articulo_revista_1 for f_hgcg_articulo_revista_1@hgcg_s1;
create or replace synonym articulo_revista_2 for f_hgcg_articulo_revista_2;

prompt Creando sinonimos para Pago Suscriptor
create or replace synonym pago_suscriptor_1 for f_hgcg_pago_suscriptor_1@hgcg_s1;
create or replace synonym pago_suscriptor_2 for f_hgcg_pago_suscriptor_2;

--Otros Sinonimos
Prompt Listo!
exit