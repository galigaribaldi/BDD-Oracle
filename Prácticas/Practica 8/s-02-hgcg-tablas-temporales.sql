--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      20/01/2021
--@Descripcion:         Creacion de tablas temporales

whenever sqlerror exit rollback;
prompt Creando tablas temporales para hgcg_s1

connect editorial_bdd/gali123@hgcg_s1

prompt Creando Tabla Temporal para Articulo
CREATE GLOBAL TEMPORARY TABLE t_articulo_insert(
    articulo_id number(10,0) not null,
    pdf blob not null,
    constraint t_pago_articulo_id_pk PRIMARY KEY(articulo_id)
) on commit preserve rows;

prompt Creando Tabla Temporal para PAgo Suscriptor
CREATE GLOBAL TEMPORARY TABLE t_pago_suscriptor_insert(
    num_pago number(38)         not null,
    suscriptor_id number(10,0)  not null, 
    fecha_pago date             not null,
    importe NUMERIC(8,2)        not null,
    recibo_pago blob            not null,
    constraint t_pago_suscriptor_insert_pk primary KEY(num_pago, suscriptor_id)
) on commit preserve rows;
-----------------------------------------------------------------------------------------------------------------------------------
prompt Creando tablas temporales para hgcg_s2

connect editorial_bdd/gali123@hgcg_s2

CREATE GLOBAL TEMPORARY TABLE t_pago_suscriptor_insert(
    num_pago number(38)         not null,
    suscriptor_id number(10,0)  not null, 
    fecha_pago date             not null,
    importe NUMERIC(8,2)        not null,
    recibo_pago blob            not null,
    constraint t_pago_suscriptor_insert_pk primary KEY(num_pago, suscriptor_id)
) on commit preserve rows;

prompt Listo!
exit