--@Author:              Cabrera Garibaldi Hernan Galileo
--@Fecha de creacion:   04/02/2021
--@Descripcion:         Creacion de Vistas


--Vista para pais
create or replace VIEW pais AS
    select pais_id, clave, nombre, region
    from pais_f1
    union all
    select pais_id, clave, nombre, region
    from pais_f2;
--Vista para Sucursal 
create or replace view sucursal AS
    select sucursal_id, nombre, clave, sucursal_anexa_id, pais_id
    from sucursal_f1
    union all
    select sucursal_id, nombre, clave, sucursal_anexa_id, pais_id
    from sucursal_f2
    union all
    select sucursal_id, nombre, clave, sucursal_anexa_id, pais_id
    from sucursal_f3;
--Vista para Status Auto
create or replace view status_auto AS
    select status_auto, clave, descripcion
    from status_auto_f1 
    union ALL
    select status_auto, clave, descripcion
    from status_auto_f2 
    union ALL
    select status_id, clave, descripcion
    from status_auto_f3
    union ALL
    select status_auto_id as status_auto, clave, descripcion
    from status_auto_f4;

-------------------------------------------------------------------
---Vista de auto no puesta puesto que lleva un BLOB
-------------------------------------------------------------------
create or replace view historico_status_auto AS
    select historico_status_id, FECHA_STATUS, auto_id, status_id
    from historico_status_auto_f1
    union all
    select historico_status_id, FECHA_STATUS, auto_id, status_auto_id
    from historico_status_auto_f2;

--Vista para Marca R1
create or replace view marca AS
    SELECT marca_id, clave, descripcion, activo
    from marca_r1;

/*
--Vista para Marca R1
create or replace view marca AS
    SELECT marca_id, clave, descripcion, activo
    from marca_r1;

--Vista para Marca R2
create or replace view marca AS
    SELECT marca_id, clave, descripcion, activo
    from marca_r2;

--Vista para Marca R3
create or replace view marca AS
    SELECT marca_id, clave, descripcion, activo
    from marca_r3;

--Vista para Marca R4
create or replace view marca AS
    SELECT marca_id, clave, descripcion, activo
    from marca_r4;
*/
/*
--Vista por modelo
create or REPLACE view modelo AS
    select modelo_id, clave, descripcion, activo, marca_id
    from modelo_f1;
*/
--Vista por modelo
create or REPLACE view modelo AS
    select modelo_id, clave, descripcion, activo, marca_id
    from modelo_f1;
-- vista auto_Carga
create or REPLACE view auto_carga AS
    select auto_id, peso_maximo, volumen, TIPO_CONSUMIBLE
    from auto_carga_f1
    union ALL
    select auto_id, peso_maximo, volumen, TIPO_CONSUMIBLE
    from auto_carga_f2;

-- Vista auto particular
create or replace view auto_particular AS
    select auto_id, NUM_CILINDROS, num_pasajeros, clase
    from auto_particular_f1
    union ALL
    select auto_id, NUM_CILINDROS, num_pasajeros, clase
    from auto_particular_f2;

-- Vista tarjeta Cliente
create or REPLACE view tarjeta_cliente AS
    select f1.cliente_id, f1.anio_expira, f1.mes_expira, f1.tipo, f2.num_tarjeta,
    f2.CODIGO_SEGURIDAD FROM tarjeta_cliente_f1 f1
    JOIN tarjeta_cliente_f2 f2 ON f1.cliente_id = f2.cliente_id;

----------------------------------------------------------------
---Pago_auto con BLOB
----------------------------------------------------------------
create or REPLACE view cliente AS
    select cliente_id, nombre, ap_paterno, ap_materno, NUM_IDENTIFICACION, EMAIL
    from cliente_f1
    UNION all
    select cliente_id, nombre, ap_paterno, ap_materno, NUM_IDENTIFICACION, EMAIL
    from cliente_f2
    UNION ALL
    select cliente_id, nombre, ap_paterno, ap_materno, NUM_IDENTIFICACION, EMAIL
    from cliente_f3;