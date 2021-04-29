--@Autor:               Cabrera Garibaldi Hernan Galileo
--@Fecha Creacion:      08/11/2020
--@Descripcion:         Código de carga

prompt Conectando a S1 - hgcg S1
connect editorial_bdd/gali123@hgcg_s1

--Si ocurre un error la ejeucución se detiene
whenever sqlerror exit rollback;

prompt limpiando del segmento 1
DELETE FROM F_HGCG_ARTICULO_2;
DELETE FROM F_HGCG_REVISTA_1;
DELETE FROM F_HGCG_ARTICULO_REVISTA_1;
DELETE FROM F_HGCG_SUSCRIPTOR_1;
DELETE FROM F_HGCG_PAGO_SUSCRIPTOR_1;
DELETE FROM F_HGCG_PAIS_1;
DELETE FROM F_HGCG_SUSCRIPTOR_2;

-- Tabla: F_HGCG_ARTICULO_2
INSERT INTO F_HGCG_ARTICULO_2(ARTICULO_ID,TITULO, RESUMEN, TEXTO)
VALUES(1, 'Los sismos','Estudio y origen de los sismos','Texto de ejemplo para el articulo');

INSERT INTO F_HGCG_ARTICULO_2(ARTICULO_ID,TITULO, RESUMEN, TEXTO)
VALUES(2, 'Fauna Marina','Estudio de la fauna marina en México','Texto de ejemplo para el articulo');

--Tabla: F_HGCG_REVISTA_1
insert into F_HGCG_REVISTA_1 (REVISTA_ID, FOLIO, TITULO, FECHA_PUBLICACION,REVISTA_ADICIONAL_ID)
values (1,'90001', 'PREMIER', TO_DATE('01/03/2017','dd/mm/yyyy'), 0);

insert into F_HGCG_REVISTA_1 (REVISTA_ID, FOLIO, TITULO, FECHA_PUBLICACION,REVISTA_ADICIONAL_ID)
values (2,'90002', 'TI en la UNAM', TO_DATE('01/09/2017','dd/mm/yyyy'), 1);

--Tabla: F_HGCG_SUSCRIPTOR_1
insert into F_HGCG_SUSCRIPTOR_1 (SUSCRIPTOR_ID,NUM_TARJETA) values (1,5420900754028724);
insert into F_HGCG_SUSCRIPTOR_1 (SUSCRIPTOR_ID,NUM_TARJETA) values (2,5800807976301529);
insert into F_HGCG_SUSCRIPTOR_1 (SUSCRIPTOR_ID,NUM_TARJETA) values (3,6202870129036021);

--Tabla: F_HGCG_PAGO_SUSCRIPTOR_1
insert into F_HGCG_PAGO_SUSCRIPTOR_1 (NUM_PAGO,SUSCRIPTOR_ID,FECHA_PAGO,IMPORTE,RECIBO_PAGO)
values (1, 1, TO_DATE('01/02/2017','dd/mm/yyyy'), 989.67, empty_blob());

insert into F_HGCG_PAGO_SUSCRIPTOR_1 (NUM_PAGO,SUSCRIPTOR_ID,FECHA_PAGO,IMPORTE,RECIBO_PAGO)
values (70, 2, TO_DATE('01/08/2017','dd/mm/yyyy'), 1000.55, empty_blob());

--Tabla: F_HGCG_PAIS_1
insert into F_HGCG_PAIS_1 (PAIS_ID,CLAVE,NOMBRE,REGION_ECONOMICA)
values (1,'MX','MEXICO','A');

--Tabla:  F_HGCG_ARTICULO_REVISTA_1
insert into F_HGCG_ARTICULO_REVISTA_1 (ARTICULO_REVISTA_ID,ARTICULO_ID,REVISTA_ID,FECHA_APROBACION,CALIFICACION)
values (1,1,1, TO_DATE('01-02-2017','dd-mm-yyyy'),9);
insert into F_HGCG_ARTICULO_REVISTA_1 (ARTICULO_REVISTA_ID,ARTICULO_ID,REVISTA_ID,FECHA_APROBACION,CALIFICACION)
values (2,2,2, TO_DATE('01-08-2017','dd-mm-yyyy'),10);

--F_HGCG_SUSCRIPTOR_2
insert into F_HGCG_SUSCRIPTOR_2 (SUSCRIPTOR_ID, NOMBRE, AP_PATERNO, AP_MATERNO, FECHA_PUBLICACION, PAIS_ID)
values (1,'OMAR','LOPEZ','MENDEZ',TO_DATE('01/01/2017','dd/mm/yyyy'),1);

insert into F_HGCG_SUSCRIPTOR_2 (SUSCRIPTOR_ID,NOMBRE,AP_PATERNO,AP_MATERNO,FECHA_PUBLICACION,PAIS_ID)
values (2,'LALO','KIM','LUNA',TO_DATE('01/01/2016','dd/mm/yyyy'),2);

insert into F_HGCG_SUSCRIPTOR_2 (SUSCRIPTOR_ID,NOMBRE,AP_PATERNO,AP_MATERNO,FECHA_PUBLICACION,PAIS_ID)
values (3,'LUCY','ZAMORA','PEREZ',TO_DATE('01/01/2015','dd/mm/yyyy'),2);

--F_HGCG_SUSCRIPTOR_3
insert into F_HGCG_SUSCRIPTOR_3 (SUSCRIPTOR_ID, NOMBRE, AP_PATERNO, AP_MATERNO, FECHA_PUBLICACION, PAIS_ID)
values (1,'OMAR','LOPEZ','MENDEZ',TO_DATE('01/01/2017','dd/mm/yyyy'),1);

insert into F_HGCG_SUSCRIPTOR_3 (SUSCRIPTOR_ID,NOMBRE,AP_PATERNO,AP_MATERNO,FECHA_PUBLICACION,PAIS_ID)
values (2,'LALO','KIM','LUNA',TO_DATE('01/01/2016','dd/mm/yyyy'),2);

insert into F_HGCG_SUSCRIPTOR_3 (SUSCRIPTOR_ID,NOMBRE,AP_PATERNO,AP_MATERNO,FECHA_PUBLICACION,PAIS_ID)
values (3,'LUCY','ZAMORA','PEREZ',TO_DATE('01/01/2015','dd/mm/yyyy'),2);
commit;
-------------------------------------------------------------------


prompt Conectando a S2 - hgcg S2
connect editorial_bdd/gali123@hgcg_s2

--Si ocurre un error la ejeucución se detiene
whenever sqlerror exit rollback;

prompt limpiando del segmento 2
DELETE FROM F_HGCG_PAGO_SUSCRIPTOR_2;
DELETE FROM F_HGCG_REVISTA_2;
DELETE FROM F_HGCG_ARTICULO_1;
DELETE FROM F_HGCG_ARTICULO_REVISTA_2;
DELETE FROM F_HGCG_PAIS_2;
DELETE FROM F_HGCG_SUSCRIPTOR_4;

prompt F_HGCG_PAGO_SUSCRIPTOR_2
insert into F_HGCG_PAGO_SUSCRIPTOR_2 (NUM_PAGO,SUSCRIPTOR_ID,FECHA_PAGO,IMPORTE,RECIBO_PAGO)
values (1,1,TO_DATE('01/02/2017','dd/mm/yyyy'), 989.67, empty_blob());

insert into F_HGCG_PAGO_SUSCRIPTOR_2 (NUM_PAGO,SUSCRIPTOR_ID,FECHA_PAGO,IMPORTE,RECIBO_PAGO)
values (70,2,TO_DATE('01/08/2017','dd/mm/yyyy'), 1000.55, empty_blob());

prompt F_HGCG_REVISTA_2
insert into F_HGCG_REVISTA_2 (REVISTA_ID, FOLIO, TITULO, FECHA_PUBLICACION,REVISTA_ADICIONAL_ID)
values (1,'90001', 'PREMIER', TO_DATE('01/03/2017','dd/mm/yyyy'), 0);

insert into F_HGCG_REVISTA_2 (REVISTA_ID, FOLIO, TITULO, FECHA_PUBLICACION,REVISTA_ADICIONAL_ID)
values (2,'90002', 'TI en la UNAM', TO_DATE('01/09/2017','dd/mm/yyyy'), 1);

prompt F_HGCG_ARTICULO_1
INSERT INTO F_HGCG_ARTICULO_1(ARTICULO_ID,PDF)
VALUES(1, empty_blob());

INSERT INTO F_HGCG_ARTICULO_1(ARTICULO_ID,PDF)
VALUES(2, empty_blob());

prompt F_HGCG_ARTICULO_REVISTA_2
insert into F_HGCG_ARTICULO_REVISTA_2 (ARTICULO_REVISTA_ID,ARTICULO_ID,REVISTA_ID,FECHA_APROBACION,CALIFICACION)
values (1,1,1, TO_DATE('01-02-2017','dd-mm-yyyy'),9);

insert into F_HGCG_ARTICULO_REVISTA_2 (ARTICULO_REVISTA_ID,ARTICULO_ID,REVISTA_ID,FECHA_APROBACION,CALIFICACION)
values (2,2,2, TO_DATE('01-08-2017','dd-mm-yyyy'),10);

prompt F_HGCG_PAIS_2
insert into F_HGCG_PAIS_2 (PAIS_ID,CLAVE,NOMBRE,REGION_ECONOMICA)
values (1,'MX','MEXICO','A');

insert into F_HGCG_PAIS_2 (PAIS_ID,CLAVE,NOMBRE,REGION_ECONOMICA)
values (2,'JAP','JAPON','B');

prompt F_HGCG_SUSCRIPTOR_4
insert into F_HGCG_SUSCRIPTOR_4 (SUSCRIPTOR_ID,NOMBRE,AP_PATERNO,AP_MATERNO,FECHA_PUBLICACION,PAIS_ID)
values (1,'OMAR','LOPEZ','MENDEZ',TO_DATE('01/01/2017','dd/mm/yyyy'),1);

insert into F_HGCG_SUSCRIPTOR_4 (SUSCRIPTOR_ID,NOMBRE,AP_PATERNO,AP_MATERNO,FECHA_PUBLICACION,PAIS_ID)
values (2,'LALO','KIM','LUNA',TO_DATE('01/01/2016','dd/mm/yyyy'),2);

insert into F_HGCG_SUSCRIPTOR_4 (SUSCRIPTOR_ID,NOMBRE,AP_PATERNO,AP_MATERNO,FECHA_PUBLICACION,PAIS_ID)
values (3,'LUCY','ZAMORA','PEREZ',TO_DATE('01/01/2015','dd/mm/yyyy'),2);

commit;
prompt Listo!
exit