--@Autor:          Jorge A. Rodriguez C
--@Fecha creación:  29/04/2017
--@Descripción:    Invoca la ejecucion de sentencias en ambos sitios

set serveroutput on

Prompt ejecutando prueba en sitio 1
connect ejemplo_revistas/ejemplo_revistas@jrcbd_s1
@s-06-jrc-sentencias-prueba.sql

Prompt ejecutando prueba en sitio 2
connect ejemplo_revistas/ejemplo_revistas@jrcbd_s2
@s-06-jrc-sentencias-prueba.sql

