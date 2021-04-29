--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/11/2020
--@Descripcion:         Consulta de fragmentos creacos en hgcg-pc

prompt Conectando a S1 - hgcg S1
connect editorial_bdd/gali123@hgcg_s1

prompt mostrando listas de fragmentos
/*describe F_HGCG_ARTICULO_2;
describe F_HGCG_REVISTA_1;
describe F_HGCG_SUSCRIPTOR_1;
describe F_HGCG_PAGO_SUSCRIPTOR_1;
describe F_HGCG_PAIS_1;
describe F_HGCG_SUSCRIPTOR_2;*/

prompt Mostrando con consulta
select table_name from user_tables where table_name like 'F_HGCG%';

prompt Conectando a S2 - hgcg S2
connect editorial_bdd/gali123@hgcg_s2

prompt mostrando listas de fragmentos
/*describe F_HGCG_PAGO_SUSCRIPTOR_2;
describe F_HGCG_REVISTA_2;
describe F_HGCG_ARTICULO_1;
describe F_HGCG_ARTICULO_REVISTA_2;
describe F_HGCG_PAIS_2;
describe F_HGCG_SUSCRIPTOR_4;*/

select table_name from user_tables where table_name like 'F_HGCG%';