/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      Windows
 * Project :      modeloDeDatos.dm1
 * Author :       Usuario de Windows
 *
 * Date Created : Wednesday, September 16, 2015 08:34:17
 * Target DBMS : InterBase
 */

/* 
 * TABLE: "Estado_Soft" 
 */

CREATE TABLE "Estado_Soft"(
    "Id_Estado_Soft"  INTEGER        NOT NULL,
    "Estado_Soft"     VARCHAR(20)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY ("Id_Estado_Soft")
)
;



/* 
 * TABLE: "Funcionalidad" 
 */

CREATE TABLE "Funcionalidad"(
    "Id_Funcionalidad"           INTEGER        NOT NULL,
    "Id_Proyecto"                INTEGER        NOT NULL,
    "Id_Persona"                 INTEGER        NOT NULL,
    "Id_Rol"                     INTEGER        NOT NULL,
    "Id_Estado_Soft"             INTEGER        NOT NULL,
    "Nombre"                     VARCHAR(30)    NOT NULL,
    "Descripcion_Funcionalidad"  BLOB           NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY ("Id_Funcionalidad", "Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
)
;



/* 
 * TABLE: "Pedido" 
 */

CREATE TABLE "Pedido"(
    "Id_Pedido"           INTEGER    NOT NULL,
    "Id_Persona"          INTEGER    NOT NULL,
    "Id_Rol"              INTEGER    NOT NULL,
    "Fecha_Solicitud"     DATE       NOT NULL,
    "Fecha_Recepcion"     DATE,
    "Descripcion_Pedido"  BLOB       NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY ("Id_Pedido", "Id_Persona", "Id_Rol")
)
;



/* 
 * TABLE: "Persona" 
 */

CREATE TABLE "Persona"(
    "Id_Persona"  INTEGER         NOT NULL,
    "Id_Rol"      INTEGER         NOT NULL,
    "Apellido"    VARCHAR(30)     NOT NULL,
    "Nombre"      VARCHAR(30)     NOT NULL,
    "Contacto"    VARCHAR(100),
    CONSTRAINT PK6 PRIMARY KEY ("Id_Persona", "Id_Rol")
)
;



/* 
 * TABLE: "Proyecto" 
 */

CREATE TABLE "Proyecto"(
    "Id_Proyecto"           INTEGER        NOT NULL,
    "Id_Persona"            INTEGER        NOT NULL,
    "Id_Rol"                INTEGER        NOT NULL,
    "Id_Estado_Soft"        INTEGER        NOT NULL,
    "Nombre"                VARCHAR(30)    NOT NULL,
    "Descripcion_Proyecto"  BLOB,
    "Fecha_Inicio"          DATE           NOT NULL,
    "Fecha_Actualizacion"   DATE,
    CONSTRAINT PK8 PRIMARY KEY ("Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
)
;



/* 
 * TABLE: "Rol" 
 */

CREATE TABLE "Rol"(
    "Id_Rol"  INTEGER        NOT NULL,
    "Rol"     VARCHAR(20)    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY ("Id_Rol")
)
;



/* 
 * TABLE: "Version_Func" 
 */

CREATE TABLE "Version_Func"(
    "Id_Version_Func"           INTEGER    NOT NULL,
    "Id_Funcionalidad"          INTEGER    NOT NULL,
    "Id_Proyecto"               INTEGER    NOT NULL,
    "Id_Persona"                INTEGER    NOT NULL,
    "Id_Rol"                    INTEGER    NOT NULL,
    "Id_Estado_Soft"            INTEGER    NOT NULL,
    "Fecha_Inicio"              DATE       NOT NULL,
    "Fecha_Fin_Probable"        DATE,
    "Fecha_Entrega"             DATE,
    "Descripcion_Version_Func"  BLOB       NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY ("Id_Version_Func", "Id_Funcionalidad", "Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
)
;



/* 
 * TABLE: "Version_Proy" 
 */

CREATE TABLE "Version_Proy"(
    "Id_Version_Proy"      INTEGER    NOT NULL,
    "Id_Proyecto"          INTEGER    NOT NULL,
    "Id_Persona"           INTEGER    NOT NULL,
    "Id_Rol"               INTEGER    NOT NULL,
    "Id_Estado_Soft"       INTEGER    NOT NULL,
    "Id_Version_Func"      INTEGER    NOT NULL,
    "Id_Funcionalidad"     INTEGER    NOT NULL,
    "Version_Mayor"        INTEGER    NOT NULL,
    "Version_Menor"        INTEGER,
    "Fecha_Actualizacion"  DATE       NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY ("Id_Version_Proy", "Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft", "Id_Version_Func", "Id_Funcionalidad")
)
;



/* 
 * TABLE: "Funcionalidad" 
 */

ALTER TABLE "Funcionalidad" ADD CONSTRAINT "RefProyecto141" 
    FOREIGN KEY ("Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
    REFERENCES "Proyecto"("Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
;


/* 
 * TABLE: "Pedido" 
 */

ALTER TABLE "Pedido" ADD CONSTRAINT "RefPersona31" 
    FOREIGN KEY ("Id_Persona", "Id_Rol")
    REFERENCES "Persona"("Id_Persona", "Id_Rol")
;


/* 
 * TABLE: "Persona" 
 */

ALTER TABLE "Persona" ADD CONSTRAINT "RefRol21" 
    FOREIGN KEY ("Id_Rol")
    REFERENCES "Rol"("Id_Rol")
;


/* 
 * TABLE: "Proyecto" 
 */

ALTER TABLE "Proyecto" ADD CONSTRAINT "RefPersona51" 
    FOREIGN KEY ("Id_Persona", "Id_Rol")
    REFERENCES "Persona"("Id_Persona", "Id_Rol")
;

ALTER TABLE "Proyecto" ADD CONSTRAINT "RefEstado_Soft151" 
    FOREIGN KEY ("Id_Estado_Soft")
    REFERENCES "Estado_Soft"("Id_Estado_Soft")
;


/* 
 * TABLE: "Version_Func" 
 */

ALTER TABLE "Version_Func" ADD CONSTRAINT "RefFuncionalidad161" 
    FOREIGN KEY ("Id_Funcionalidad", "Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
    REFERENCES "Funcionalidad"("Id_Funcionalidad", "Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
;


/* 
 * TABLE: "Version_Proy" 
 */

ALTER TABLE "Version_Proy" ADD CONSTRAINT "RefProyecto131" 
    FOREIGN KEY ("Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
    REFERENCES "Proyecto"("Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
;

ALTER TABLE "Version_Proy" ADD CONSTRAINT "RefVersion_Func181" 
    FOREIGN KEY ("Id_Version_Func", "Id_Funcionalidad", "Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
    REFERENCES "Version_Func"("Id_Version_Func", "Id_Funcionalidad", "Id_Proyecto", "Id_Persona", "Id_Rol", "Id_Estado_Soft")
;


