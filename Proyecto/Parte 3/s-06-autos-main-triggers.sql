--@Autor:           Cabrera Garibaldi Hernan Galileo
--@Fecha creación:  06/02/2021
--@Descripción:     Script principal - creación de triggers
clear screen

whenever sqlerror exit rollback;

prompt =====================================
prompt Creando triggers para hgcg_s1
prompt =====================================
connect autos_bdd/gali123@hgcg_S1
@s-06-autos-trigger-pais.sql --el mismo para todos los nodos
@s-06-autos-hgcg-s1-trigger-sucursal.sql
@s-06-autos-hgcg-s1-trigger-auto.sql
@s-06-autos-hgcg-s1-trigger-auto-particular.sql
@s-06-autos-hgcg-s1-trigger-auto-carga.sql
@s-06-autos-trigger-historico-status-auto.sql --el mismo para todos los nodos
@s-06-autos-trigger-cliente.sql -- el mismo para todos
@s-06-autos-trigger-tarjeta-cliente.sql -- el mismo para todos
@s-06-autos-hgcg-s1-trigger-pago-auto.sql
--tablas replicadas
@s-06-autos-trigger-modelo.sql -- el mismo para todos
@s-06-autos-trigger-marca.sql -- el mismo para todos

prompt =====================================
prompt Creando triggers para hgcg_s2
prompt =====================================
connect autos_bdd/gali123@hgcg_s2
@s-06-autos-trigger-pais.sql --el mismo para todos los nodos
@s-06-autos-hgcg-s2-trigger-sucursal.sql
@s-06-autos-hgcg-s2-trigger-auto.sql
@s-06-autos-hgcg-s2-trigger-auto-particular.sql
@s-06-autos-hgcg-s2-trigger-auto-carga.sql
@s-06-autos-trigger-historico-status-auto.sql --el mismo para todos los nodos
@s-06-autos-trigger-cliente.sql -- el mismo para todos
@s-06-autos-trigger-tarjeta-cliente.sql -- el mismo para todos
@s-06-autos-hgcg-s2-trigger-pago-auto.sql
--tablas replicadas
@s-06-autos-trigger-modelo.sql -- el mismo para todos
@s-06-autos-trigger-marca.sql -- el mismo para todos

prompt =====================================
prompt Creando triggers para igcg_s1
prompt =====================================
connect autos_bdd/gali123@igcg_s1
@s-06-autos-trigger-pais.sql --el mismo para todos los nodos
@s-06-autos-hgcg-s1-trigger-sucursal.sql -- reutilizando script
@s-06-autos-hgcg-s1-trigger-auto.sql -- reutilizando script
@s-06-autos-hgcg-s1-trigger-auto-particular.sql --reutilizando script
@s-06-autos-hgcg-s1-trigger-auto-carga.sql --reutilizando script
@s-06-autos-trigger-historico-status-auto.sql --el mismo para todos los nodos
@s-06-autos-trigger-cliente.sql -- el mismo para todos
@s-06-autos-trigger-tarjeta-cliente.sql -- el mismo para todos
@s-06-autos-hgcg-s1-trigger-pago-auto.sql --reutilizando script
--tablas replicadas
@s-06-autos-trigger-modelo.sql -- el mismo para todos
@s-06-autos-trigger-marca.sql -- el mismo para todos

prompt =====================================
prompt Creando triggers para igcg_s2
prompt =====================================
connect autos_bdd/gali123@igcg_s2
@s-06-autos-trigger-pais.sql --el mismo para todos los nodos
@s-06-autos-hgcg-s1-trigger-sucursal.sql -- reutilizando script
------
@s-06-autos-igcg-s2-trigger-auto.sql -- aqui no se reutiliza por tener el dato BLOB
------
@s-06-autos-hgcg-s1-trigger-auto-particular.sql --reutilizando script
@s-06-autos-hgcg-s1-trigger-auto-carga.sql --reutilizando script
@s-06-autos-trigger-historico-status-auto.sql --el mismo para todos los nodos
@s-06-autos-trigger-cliente.sql -- el mismo para todos
@s-06-autos-trigger-tarjeta-cliente.sql -- el mismo para todos
@s-06-autos-hgcg-s1-trigger-pago-auto.sql --reutilizando script
--tablas replicadas
@s-06-autos-trigger-modelo.sql -- el mismo para todos
@s-06-autos-trigger-marca.sql -- el mismo para todos
prompt Listo!
disconnect