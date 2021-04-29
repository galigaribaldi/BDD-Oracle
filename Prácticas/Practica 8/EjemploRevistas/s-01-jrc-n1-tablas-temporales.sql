--@Autor:          Jorge A. Rodriguez C
--@Fecha creación:  29/04/2017
--@Descripción:    creacion de tablas temporales

--tabla temporal para manejar blobs - transparencia para update
create global temporary table t_update_revista_3(
  revista_id number(10,0) constraint t_jrc_update_revista_3_pk  primary key,
  pdf blob not null
) on commit preserve rows;

--tabla temporal para manejar blobs - transparencia para insert
create global temporary table t_insert_revista_3(
  revista_id number(10,0) constraint t_jrc_insert_revista_3_pk  primary key,
  pdf blob not null
) on commit preserve rows;