--@Autor: Cabrera Garibaldi Hernan Galilwo
--@Fecha creación: 15/01/2020
--@Descripción: Consultas con conteo de registros en cada PDB

prompt Conectando al sitio 1

connect editorial_bdd/gali123@hgcg_s1

select (select count(*) from pais) pais,
	(select count(*) from suscriptor) suscriptor,
	(select count(*) from articulo) articulo,
	(select count(*) from revista) revista,
	(select count(*) from articulo_revista) articulo_revista,
	(select count(*) from pago_suscriptor) pago_suscriptor
from dual;

prompt Conectando al sitio 2

connect editorial_bdd/gali123@hgcg_s2

select (select count(*) from pais) pais,
	(select count(*) from suscriptor) suscriptor,
	(select count(*) from articulo) articulo,
	(select count(*) from revista) revista,
	(select count(*) from articulo_revista) articulo_revista,
	(select count(*) from pago_suscriptor) pago_suscriptor
from dual;