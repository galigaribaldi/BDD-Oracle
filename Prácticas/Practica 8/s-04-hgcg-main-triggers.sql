--@Autor: Cabrera Garibaldi Hernan Galileo
--@Fecha creación: 23/01/2021
--@Descripción: Creación de triggers

whenever sqlerror exit rollback
Prompt =================================
Prompt creando triggers en S1
connect editorial_bdd/gali123@hgcg_s1
Prompt =================================

Prompt =================================
Prompt creando trigger para pais
@s-03-hgcg-pais-trigger.sql
show errors
Prompt =================================

Prompt =================================
Prompt creando trigger para suscriptor
@s-03-hgcg-suscriptor-n1-trigger.sql
show errors
Prompt =================================

Prompt =================================
Prompt creando trigger para pago_suscriptor
@s-03-hgcg-pago-suscriptor-n1-trigger.sql
show errors
Prompt =================================

Prompt =================================
Prompt creando trigger para articulo
@s-03-hgcg-articulo-n1-trigger.sql
show errors
Prompt =================================

Prompt =================================
Prompt creando triggers en S2
connect editorial_bdd/gali123@hgcg_s2
Prompt =================================

Prompt =================================
Prompt creando trigger para pais
@s-03-hgcg-pais-trigger.sql
show errors
Prompt =================================

Prompt =================================
Prompt creando trigger para suscriptor
@s-03-hgcg-suscriptor-n2-trigger.sql
show errors
Prompt =================================

Prompt =================================
Prompt creando trigger para pago_suscriptor
@s-03-hgcg-pago-suscriptor-n2-trigger.sql
show errors
Prompt =================================

Prompt =================================
Prompt creando trigger para articulo
@s-03-hgcg-articulo-n2-trigger.sql
show errors
Prompt =================================

Prompt Listo!
exit