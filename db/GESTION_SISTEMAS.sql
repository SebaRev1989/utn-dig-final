/*
 * ER/Studio 8.0 SQL Code Generation
 * Company :      Cycomat S.R.L.
 * Project :      "Gestión de Sistemas" - modeloDeDatos.dm1
 * Author :       Sebastián Reverso
 *
 * Date Created : Wednesday, September 16, 2015 08:34:17
 * Target DBMS : InterBase
 *
 * Date Modified : Wednesday, September 16, 2015
 * Target DBMS : FirebirdSQL
 */

/* 
 * TABLE: "Estado_Soft" 
 */

CREATE TABLE "Estado_Soft"(
    "Id"  			  INTEGER        NOT NULL,
    "Estado_Soft"     VARCHAR(20)    NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY ("Id")
);

/* 
 * TABLE: "Funcionalidad" 
 */

CREATE TABLE "Funcionalidad"(
    "Id"          				 INTEGER        NOT NULL,
    "Id_Proyecto"                INTEGER        NOT NULL,
    "Nombre"                     VARCHAR(30)    NOT NULL,
    "Descripcion"  				 BLOB           NOT NULL,
    CONSTRAINT PK11 PRIMARY KEY ("Id")
);

ALTER TABLE "Funcionalidad" ADD CONSTRAINT "FK_Funcionalidad_1" 
    FOREIGN KEY ("Id_Proyecto") REFERENCES "Proyecto"("Id");

/* 
 * TABLE: "Pedido" 
 */

CREATE TABLE "Pedido"(
    "Id"		          INTEGER    NOT NULL,
    "Id_Persona"          INTEGER    NOT NULL,
	"Id_Proyecto"		  INTEGER, 					  /* Proyecto donde se incluyo el pedido */
    "Fecha_Solicitud"     DATE       NOT NULL,
    "Fecha_Recepcion"     DATE,
    "Descripcion"		  BLOB       NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY ("Id")
);

ALTER TABLE "Pedido" ADD CONSTRAINT "FK_Pedido_1"
	FOREIGN KEY ("Id_Persona") REFERENCES "Persona"("Id");

ALTER TABLE "Pedido" ADD CONSTRAINT "FK_Pedido_2"
	FOREIGN KEY ("Id_Proyecto") REFERENCES "Proyecto"("Id");

/* 
 * TABLE: "Persona" 
 */

CREATE TABLE "Persona"(
    "Id"  		  INTEGER         NOT NULL,
    "Id_Rol"      INTEGER         NOT NULL,
    "Apellido"    VARCHAR(30)     NOT NULL,
    "Nombre"      VARCHAR(30)     NOT NULL,
    "Contacto"    VARCHAR(100),
	"User"		  VARCHAR(20)	  NOT NULL,
	"Password"	  VARCHAR(20)	  NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY ("Id")
);

ALTER TABLE "Persona" ADD CONSTRAINT "FK_Personal_1"
	FOREIGN KEY ("Id_Rol") REFERENCES "Rol"("Id");

/* 
 * TABLE: "Proyecto" 
 */

CREATE TABLE "Proyecto"(
    "Id"			        INTEGER        NOT NULL,
    "Id_Persona"            INTEGER        NOT NULL,  /* Gestor del proyecto */
    "Id_Estado_Soft"        INTEGER        NOT NULL,
    "Nombre"                VARCHAR(30)    NOT NULL,
    "Descripcion"			BLOB,
    "Fecha_Inicio"          DATE           NOT NULL,
    "Fecha_Actualizacion"   DATE,
    CONSTRAINT PK8 PRIMARY KEY ("Id")
);

ALTER TABLE "Proyecto" ADD CONSTRAINT "FK_Proyecto_1"
	FOREIGN KEY ("Id_Persona") REFERENCES "Persona"("Id");
	
ALTER TABLE "Proyecto" ADD CONSTRAINT "FK_Proyecto_2"
	FOREIGN KEY ("Id_Estado_Soft") REFERENCES "Estado_Soft"("Id");

/* 
 * TABLE: "Rol" 
 */

CREATE TABLE "Rol"(
    "Id"  	  INTEGER        NOT NULL,
    "Rol"     VARCHAR(20)    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY ("Id")
);



/* 
 * TABLE: "Version_Func" 
 */

CREATE TABLE "Version_Func"(
    "Id"  				        INTEGER    NOT NULL,
    "Id_Funcionalidad"          INTEGER    NOT NULL,
    "Id_Proyecto"               INTEGER    NOT NULL,
    "Id_Persona"                INTEGER    NOT NULL,  /* Desarrollador asignado */
    "Id_Estado_Soft"            INTEGER    NOT NULL,  /* Estado de la version */
	"Id_Version_Proy"			INTEGER,			  /* Version del proyecto donde se incluye la version */
    "Fecha_Inicio"              DATE       NOT NULL,
    "Fecha_Fin_Probable"        DATE,
    "Fecha_Entrega"             DATE,
    "Descripcion"		 		BLOB       NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY ("Id")
);

ALTER TABLE "Version_Func" ADD CONSTRAINT "FK_Version_Func_1"
	FOREIGN KEY ("Id_Funcionalidad") REFERENCES "Funcionalidad"("Id");

ALTER TABLE "Version_Func" ADD CONSTRAINT "FK_Version_Func_2"
	FOREIGN KEY ("Id_Proyecto") REFERENCES "Proyecto"("Id");
	
ALTER TABLE "Version_Func" ADD CONSTRAINT "FK_Version_Func_3"
	FOREIGN KEY ("Id_Persona") REFERENCES "Persona"("Id");
	
ALTER TABLE "Version_Func" ADD CONSTRAINT "FK_Version_Func_4"
	FOREIGN KEY ("Id_Estado_Soft") REFERENCES "Estado_Soft"("Id");
	
ALTER TABLE "Version_Func" ADD CONSTRAINT "FK_Version_Func_5"
	FOREIGN KEY ("Id_Version_Proy") REFERENCES "Version_Proy"("Id");

/* 
 * TABLE: "Version_Proy" 
 */

CREATE TABLE "Version_Proy"(
    "Id" 				   INTEGER    NOT NULL,
    "Id_Proyecto"          INTEGER    NOT NULL,
    "Version_Mayor"        INTEGER    NOT NULL,
    "Version_Menor"        INTEGER,
    "Fecha_Actualizacion"  DATE       NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY ("Id")
);

ALTER TABLE "Version_Proy" ADD CONSTRAINT "FK_Version_Proy_1"
	FOREIGN KEY ("Id_Proyecto") REFERENCES "Proyecto"("Id");