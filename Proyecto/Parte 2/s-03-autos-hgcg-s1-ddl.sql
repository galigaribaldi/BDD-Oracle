--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      UNAM
-- Project :      s-03-autos-hgcg-s1-ddl.DM1
-- Author :       Windows User
--
-- Date Created : Wednesday, February 03, 2021 19:59:30
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: AUTO_CARGA_F1_HGCG_S1 
--

CREATE TABLE AUTO_CARGA_F1_HGCG_S1(
    AUTO_ID            NUMBER(10, 0)    NOT NULL,
    PESO_MAXIMO        NUMBER(10, 0)    NOT NULL,
    VOLUMEN            NUMBER(10, 0)    NOT NULL,
    TIPO_CONSUMIBLE    CHAR(1)          NOT NULL,
    CONSTRAINT AUTO_ID_PK PRIMARY KEY (AUTO_ID)
)
;



-- 
-- TABLE: AUTO_F1_HGCG_S1 
--

CREATE TABLE AUTO_F1_HGCG_S1(
    AUTO_ID         NUMBER(10, 0)    NOT NULL,
    ANIO            NUMBER(4, 0)     NOT NULL,
    NUM_SERIE       VARCHAR2(20)     NOT NULL,
    TIPO            CHAR(1)          NOT NULL,
    PRECIO          NUMBER(9, 2)     NOT NULL,
    FECHA_STATUS    DATE             NOT NULL,
    MODELO_ID       NUMBER(10, 0)    NOT NULL,
    STATUS_AUTO     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT AUTO_ID_PK1 PRIMARY KEY (AUTO_ID)
)
;



-- 
-- TABLE: AUTO_PARTICULAR_F1_HGCG_S1 
--

CREATE TABLE AUTO_PARTICULAR_F1_HGCG_S1(
    AUTO_ID          NUMBER(10, 0)    NOT NULL,
    NUM_CILINDROS    NUMBER(1, 0)     NOT NULL,
    NUM_PASAJEROS    NUMBER(1, 0)     NOT NULL,
    CLASE            CHAR(1)          NOT NULL,
    CONSTRAINT AUTO_ID_PK10 PRIMARY KEY (AUTO_ID)
)
;



-- 
-- TABLE: MARCA_R_HGCH_S1 
--

CREATE TABLE MARCA_R_HGCH_S1(
    MARCA_ID       NUMBER(2, 0)     NOT NULL,
    CLAVE          VARCHAR2(50)     NOT NULL,
    DESCRIPCION    VARCHAR2(500)    NOT NULL,
    ACTIVO         NUMBER(1, 0)     NOT NULL,
    CONSTRAINT MARCA_ID_PK PRIMARY KEY (MARCA_ID)
)
;



-- 
-- TABLE: MODELO_R_HGCG_S1 
--

CREATE TABLE MODELO_R_HGCG_S1(
    MODELO_ID      NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(50)     NOT NULL,
    DESCRIPCION    VARCHAR2(500)    NOT NULL,
    ACTIVO         NUMBER(1, 0)     NOT NULL,
    MARCA_ID       NUMBER(2, 0)     NOT NULL,
    CONSTRAINT MODELO_ID_PK PRIMARY KEY (MODELO_ID)
)
;



-- 
-- TABLE: PAGO_AUTO_F1_HGCG_S1 
--

CREATE TABLE PAGO_AUTO_F1_HGCG_S1(
    CLIENTE_ID     NUMBER(10, 0)    NOT NULL,
    AUTO_ID        NUMBER(10, 0)    NOT NULL,
    FECHA_PAGO     DATE             NOT NULL,
    IMPORTE        NUMBER(8, 2)     NOT NULL,
    RECIBO_PAGO    BLOB             NOT NULL,
    CONSTRAINT CLIENTE_ID_PK PRIMARY KEY (CLIENTE_ID, AUTO_ID)
)
;



-- 
-- TABLE: PAIS_F1_HGCG_S1 
--

CREATE TABLE PAIS_F1_HGCG_S1(
    PAIS_ID    NUMBER(4, 0)    NOT NULL,
    CLAVE      VARCHAR2(4)     NOT NULL,
    NOMBRE     VARCHAR2(40)    NOT NULL,
    REGION     VARCHAR2(3)     NOT NULL,
    CONSTRAINT PAIS_ID_PK PRIMARY KEY (PAIS_ID)
)
;



-- 
-- TABLE: STATUS_AUTO_F1_HGCG_S1 
--

CREATE TABLE STATUS_AUTO_F1_HGCG_S1(
    STATUS_AUTO    NUMBER(10, 0)    NOT NULL,
    CLAVE          VARCHAR2(20)     NOT NULL,
    DESCRIPCION    VARCHAR2(40)     NOT NULL,
    CONSTRAINT STATUS_AUTO_PK PRIMARY KEY (STATUS_AUTO)
)
;



-- 
-- TABLE: SUCURSAL_F1_HGCG_S1 
--

CREATE TABLE SUCURSAL_F1_HGCG_S1(
    SUCURSAL_ID          NUMBER(10, 0)    NOT NULL,
    NOMBRE               VARCHAR2(40)     NOT NULL,
    CLAVE                VARCHAR2(8)      NOT NULL,
    SUCURSAL_ANEXA_ID    NUMBER(38, 0),
    PAIS_ID              NUMBER(4, 0)     NOT NULL,
    CONSTRAINT SUCURSAL_ID_PK PRIMARY KEY (SUCURSAL_ID)
)
;



-- 
-- TABLE: AUTO_CARGA_F1_HGCG_S1 
--

ALTER TABLE AUTO_CARGA_F1_HGCG_S1 ADD CONSTRAINT RefAUTO_F1_HGCG_S16 
    FOREIGN KEY (AUTO_ID)
    REFERENCES AUTO_F1_HGCG_S1(AUTO_ID)
;


-- 
-- TABLE: AUTO_F1_HGCG_S1 
--

ALTER TABLE AUTO_F1_HGCG_S1 ADD CONSTRAINT RefMODELO_R_HGCG_S12 
    FOREIGN KEY (MODELO_ID)
    REFERENCES MODELO_R_HGCG_S1(MODELO_ID)
;

ALTER TABLE AUTO_F1_HGCG_S1 ADD CONSTRAINT RefSTATUS_AUTO_F1_HGCG_S13 
    FOREIGN KEY (STATUS_AUTO)
    REFERENCES STATUS_AUTO_F1_HGCG_S1(STATUS_AUTO)
;


-- 
-- TABLE: AUTO_PARTICULAR_F1_HGCG_S1 
--

ALTER TABLE AUTO_PARTICULAR_F1_HGCG_S1 ADD CONSTRAINT RefAUTO_F1_HGCG_S17 
    FOREIGN KEY (AUTO_ID)
    REFERENCES AUTO_F1_HGCG_S1(AUTO_ID)
;


-- 
-- TABLE: MODELO_R_HGCG_S1 
--

ALTER TABLE MODELO_R_HGCG_S1 ADD CONSTRAINT RefMARCA_R_HGCH_S14 
    FOREIGN KEY (MARCA_ID)
    REFERENCES MARCA_R_HGCH_S1(MARCA_ID)
;


-- 
-- TABLE: PAGO_AUTO_F1_HGCG_S1 
--

ALTER TABLE PAGO_AUTO_F1_HGCG_S1 ADD CONSTRAINT RefAUTO_F1_HGCG_S15 
    FOREIGN KEY (AUTO_ID)
    REFERENCES AUTO_F1_HGCG_S1(AUTO_ID)
;


-- 
-- TABLE: SUCURSAL_F1_HGCG_S1 
--

ALTER TABLE SUCURSAL_F1_HGCG_S1 ADD CONSTRAINT RefPAIS_F1_HGCG_S11 
    FOREIGN KEY (PAIS_ID)
    REFERENCES PAIS_F1_HGCG_S1(PAIS_ID)
;

