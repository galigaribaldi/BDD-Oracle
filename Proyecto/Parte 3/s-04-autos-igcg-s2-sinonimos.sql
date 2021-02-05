--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   04/02/2021
--@Descripcion:         Creacion de sinonimos en igcg_s2


prompt Creando Sinonimos para Pais
-- Pais -> 2
create or replace synonym pais_f1 for pais_f1_hgcg_s1@hgcg_s1;
create or replace synonym pais_f2 for pais_f2_hgcg_s2@hgcg_s2;

prompt Creando Sinonimos para sucursal
-- sucursal -> 3
create or replace synonym sucursal_f1 for sucursal_f1_hgcg_s1@hgcg_s1;
create or replace synonym sucursal_f2 for sucursal_f2_hgcg_s2@hgcg_s2;
create or replace synonym sucursal_f3 for sucursal_f3_igcg_s1@igcg_s1;

prompt Creando Sinonimos para Status Auto
-- Status Auto -> 4
create or replace synonym status_auto_f1 for status_auto_f1_hgcg_s1@hgcg_s1;
create or replace synonym status_auto_f2 for status_auto_f2_hgcg_s2@hgcg_s2;
create or replace synonym status_auto_f3 for status_auto_f1_igcg_s1@igcg_s1;
create or replace synonym status_auto_f4 for status_auto_f2_igcg_a2;

prompt Creando Sinonimos para auto
-- Auto -> 3
create or replace synonym auto_f1 for auto_f1_hgcg_s1@hgcg_s1;
create or replace synonym auto_f2 for auto_f2_hgcg_s2@hgcg_s2;
create or replace synonym auto_f3 for auto_f2_igcg_s2;

prompt Creando Sinonimos para historico status auto
-- historico status auto
create or replace synonym historico_status_auto_f1 for historico_status_auto_f1_igcg_s1@igcg_s1;
create or replace synonym historico_status_auto_f2 for historico_status_auto_f2_igcg_s2;

prompt Creando Sinonimos para marca
-- marca
create or replace synonym marca_r1 for marca_r_hgch_s1@hgcg_s1;
create or replace synonym marca_r2 for marca_r_hgch_s2@hgcg_s2;
create or replace synonym marca_r3 for marca_r_igcg_s1@igcg_s1;
create or replace synonym marca_r4 for marca_r_igcg_s2;

prompt Creando Sinonimos para modelo
-- modelo
create or replace synonym modelo_r1 for modelo_r_hgcg_s1@hgcg_s1;
create or replace synonym modelo_r2 for modelo_r_hgcg_s2@hgcg_s2;
create or replace synonym modelo_r3 for modelo_r_igcg_s1@igcg_s1;
create or replace synonym modelo_r4 for modelo_r_igcg_s2;

prompt Creando Sinonimos para auto carga
-- auto carga
create or replace synonym auto_carga_f1 for auto_carga_f1_hgcg_s1@hgcg_s1;
create or replace synonym auto_carga_f2 for auto_carga_f2_hgcg_s2@hgcg_s2;

prompt Creando Sinonimos para auto particular
-- auto partiuclar
create or replace synonym auto_particular_f1 for auto_particular_f1_hgcg_s1@hgcg_s1;
create or replace synonym auto_particular_f2 for auto_particular_f2_hgcg_s2@hgcg_s2;
---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
prompt Creando Sinonimos para tarjeta Cliente
-- tarjeta Cliente
create or replace synonym tarjeta_cliente_f1 for tarjeta_cliente_f1_hgcg_s2@hgcg_s2;
create or replace synonym tarjeta_cliente_f2 for tarjeta_cliente_f2_igcg_s1@igcg_s1;
---------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
prompt Creando Sinonimos para pago auto
-- pago auto
create or replace synonym pago_auto_f1 for pago_auto_f1_hgcg_s1@hgcg_s1;
create or replace synonym pago_auto_f2 for pago_auto_f2_hgcg_s2@hgcg_s2;


prompt Creando Sinonimos para cliente
-- cliente
create or replace synonym cliente_f1 for cliente_f1_hgcg_s2@hgcg_s2;
create or replace synonym cliente_f2 for cliente_f2_igcg_s1@igcg_s1;
create or replace synonym cliente_f3 for cliente_f2_igcg_s2;