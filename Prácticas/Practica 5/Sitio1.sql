--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      sitio1.DM1
-- Author :       Windows User
--
-- Date Created : Tuesday, November 10, 2020 00:21:38
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: F_HGCG_ARTICULO_2 
--

CREATE TABLE F_HGCG_ARTICULO_2(
    ARTICULO_ID    NUMBER(40, 0)    NOT NULL,
    TITULO         VARCHAR2(40)     NOT NULL,
    RESUMEN        VARCHAR2(40)     NOT NULL,
    TEXTO          VARCHAR2(40)     NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (ARTICULO_ID)
)
;



-- 
-- TABLE: F_HGCG_ARTICULO_REVISTA_1 
--

CREATE TABLE F_HGCG_ARTICULO_REVISTA_1(
    ARTICULO_REVISTA_ID    NUMBER(38, 0)    NOT NULL,
    ARTICULO_ID            NUMBER(40, 0),
    REVISTA_ID             NUMBER(38, 0),
    FECHA_APROBACION       DATE             NOT NULL,
    CALIFICACION           NUMBER(40, 0)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (ARTICULO_REVISTA_ID)
)
;



-- 
-- TABLE: F_HGCG_PAGO_SUSCRIPTOR_1 
--

CREATE TABLE F_HGCG_PAGO_SUSCRIPTOR_1(
    SUSCRIPTOR_ID    NUMBER(40, 0)    NOT NULL,
    NUM_PAGO         NUMBER           NOT NULL,
    FECHA_PAGO       DATE             NOT NULL,
    IMPORTE          NUMBER(40, 0)    NOT NULL,
    RECIBO_PAGO      BLOB,
    CONSTRAINT PK2_1_1 PRIMARY KEY (SUSCRIPTOR_ID)
)
;



-- 
-- TABLE: F_HGCG_PAIS_1 
--

CREATE TABLE F_HGCG_PAIS_1(
    PAIS_ID             NUMBER(38, 0)    NOT NULL,
    CLAVE               VARCHAR2(3)      NOT NULL,
    NOMBRE              VARCHAR2(40)     NOT NULL,
    REGION_ECONOMICA    CHAR             NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (PAIS_ID)
)
;



-- 
-- TABLE: F_HGCG_REVISTA_1 
--

CREATE TABLE F_HGCG_REVISTA_1(
    REVISTA_ID              NUMBER(38, 0)    NOT NULL,
    FOLIO                   VARCHAR2(40)     NOT NULL,
    TITULO                  VARCHAR2(40)     NOT NULL,
    FECHA_PUBLICACION       DATE             NOT NULL,
    REVISTA_ADICIONAL_ID    NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (REVISTA_ID)
)
;



-- 
-- TABLE: F_HGCG_SUSCRIPTOR_1 
--

CREATE TABLE F_HGCG_SUSCRIPTOR_1(
    SUSCRIPTOR_ID    NUMBER(40, 0)    NOT NULL,
    NUM_TARJETA      VARCHAR2(16)     NOT NULL,
    CONSTRAINT PK2_2 PRIMARY KEY (SUSCRIPTOR_ID)
)
;



-- 
-- TABLE: F_HGCG_SUSCRIPTOR_2 
--

CREATE TABLE F_HGCG_SUSCRIPTOR_2(
    SUSCRIPTOR_ID        NUMBER(40, 0)    NOT NULL,
    NOMBRE               VARCHAR2(40)     NOT NULL,
    AP_PATERNO           VARCHAR2(40)     NOT NULL,
    AP_MATERNO           VARCHAR2(40),
    FECHA_PUBLICACION    DATE             NOT NULL,
    PAIS_ID              NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (SUSCRIPTOR_ID)
)
;



-- 
-- TABLE: F_HGCG_SUSCRIPTOR_3 
--

CREATE TABLE F_HGCG_SUSCRIPTOR_3(
    SUSCRIPTOR_ID        NUMBER(40, 0)    NOT NULL,
    NOMBRE               VARCHAR2(40)     NOT NULL,
    AP_PATERNO           VARCHAR2(40)     NOT NULL,
    AP_MATERNO           VARCHAR2(40),
    FECHA_PUBLICACION    VARCHAR2(40)     NOT NULL,
    PAIS_ID              NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK2_1 PRIMARY KEY (SUSCRIPTOR_ID)
)
;



-- 
-- TABLE: F_HGCG_ARTICULO_REVISTA_1 
--

ALTER TABLE F_HGCG_ARTICULO_REVISTA_1 ADD CONSTRAINT RefF_HGCG_REVISTA_14 
    FOREIGN KEY (REVISTA_ID)
    REFERENCES F_HGCG_REVISTA_1(REVISTA_ID)
;

ALTER TABLE F_HGCG_ARTICULO_REVISTA_1 ADD CONSTRAINT RefF_HGCG_ARTICULO_25 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES F_HGCG_ARTICULO_2(ARTICULO_ID)
;


-- 
-- TABLE: F_HGCG_PAGO_SUSCRIPTOR_1 
--

ALTER TABLE F_HGCG_PAGO_SUSCRIPTOR_1 ADD CONSTRAINT RefF_HGCG_SUSCRIPTOR_19 
    FOREIGN KEY (SUSCRIPTOR_ID)
    REFERENCES F_HGCG_SUSCRIPTOR_1(SUSCRIPTOR_ID)
;


-- 
-- TABLE: F_HGCG_SUSCRIPTOR_2 
--

ALTER TABLE F_HGCG_SUSCRIPTOR_2 ADD CONSTRAINT RefF_HGCG_PAIS_16 
    FOREIGN KEY (PAIS_ID)
    REFERENCES F_HGCG_PAIS_1(PAIS_ID)
;


