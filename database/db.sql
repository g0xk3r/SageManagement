-- DROP DATABASE sagemanagmentdb;
CREATE DATABASE sagemanagmentdb;

use sagemanagmentdb;

CREATE TABLE IF NOT EXISTS usuario(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    user VARCHAR (20),
    pass VARCHAR (100),
    firma LONGBLOB,
    estatus VARCHAR (10),
    ingNomb VARCHAR (40),
    empresa VARCHAR (100),
    rfcAdm VARCHAR (13),
    dominio VARCHAR (30),
    direccionAdm TEXT,
    telAdm1 INT,
    telAdm2 INT,
    UNIQUE (user)
);

CREATE TABLE IF NOT EXISTS cliente(
    idCliente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombreCliente VARCHAR (100) NOT NULL,
    RFC VARCHAR (13),
    calle VARCHAR (50),
    numExt INT (6),
    numInt VARCHAR (6),
    colonia VARCHAR (30),
    delMun VARCHAR (30),
    ciudad VARCHAR (50),
    pais VARCHAR (30),
    cp INT (5),
    telCont VARCHAR (20),
    telHosp VARCHAR (20),
    email VARCHAR (30),
    ateDirec VARCHAR (50),
    cargo VARCHAR (30),
    numContrato INT (6),
    numLici INT (6),
    adminis VARCHAR (50),
    cargoDos VARCHAR (50),
    manteniBiomedica VARCHAR (50),
    cargoTres VARCHAR (50),
    usuario VARCHAR (100),
    cargoCuatro VARCHAR (50),
    ingTec VARCHAR (50),
    cargoCinco VARCHAR (50)
);

CREATE TABLE IF NOT EXISTS ordenes(
    folio INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    idCliente INT,
    repAntesServ TEXT,
    observaciones TEXT,
    usuarioFirma LONGBLOB,
    mantBiomAdm LONGBLOB,
    sello LONGBLOB,
    user_id INT,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    CONSTRAINT fk_cliente FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES usuario(id)
);

CREATE TABLE IF NOT EXISTS ordenes_equipo(
    folio INT,
    equipo VARCHAR (30),
    marca VARCHAR (30),
    modelo VARCHAR (20),
    numSerie VARCHAR (20),
    numInvent VARCHAR (20),
    FOREIGN KEY (folio) REFERENCES ordenes(folio)
);

CREATE TABLE IF NOT EXISTS ordenes_refa_consu_act (
    folio INT,
    refaccion1 VARCHAR (40),
    refaccion2 VARCHAR (40),
    refaccion3 VARCHAR (40),
    refaccion4 VARCHAR (40),
    refaccion5 VARCHAR (40),
    refaccion6 VARCHAR (40),
    refaccion7 VARCHAR (40),
    refaccion8 VARCHAR (40),
    refaccion9 VARCHAR (40),
    refaccion10 VARCHAR (40),
    refaccion11 VARCHAR (40),
    refaccion12 VARCHAR (40),
    refaccion13 VARCHAR (40),
    refaccion14 VARCHAR (40),
    refaccion15 VARCHAR (40),
    refaccion16 VARCHAR (40),
    refaccion17 VARCHAR (40),
    refaccion18 VARCHAR (40),
    refaccion19 VARCHAR (40),
    refaccion20 VARCHAR (40),
    actRealizadas1 VARCHAR (40),
    actRealizadas2 VARCHAR (40),
    actRealizadas3 VARCHAR (40),
    actRealizadas4 VARCHAR (40),
    actRealizadas5 VARCHAR (40),
    actRealizadas6 VARCHAR (40),
    actRealizadas7 VARCHAR (40),
    actRealizadas8 VARCHAR (40),
    actRealizadas9 VARCHAR (40),
    actRealizadas10 VARCHAR (40),
    actRealizadas11 VARCHAR (40),
    actRealizadas12 VARCHAR (40),
    actRealizadas13 VARCHAR (40),
    actRealizadas14 VARCHAR (40),
    actRealizadas15 VARCHAR (40),
    actRealizadas16 VARCHAR (40),
    actRealizadas17 VARCHAR (40),
    actRealizadas18 VARCHAR (40),
    actRealizadas19 VARCHAR (40),
    actRealizadas20 VARCHAR (40),
    FOREIGN KEY (folio) REFERENCES ordenes(folio)
);

CREATE TABLE IF NOT EXISTS ordenes_condiciones(
    folio INT,
    tipoContrato VARCHAR (20),
    servSoli VARCHAR (20),
    FOREIGN KEY (folio) REFERENCES ordenes(folio)
);

CREATE TABLE IF NOT EXISTS ordenes_guardadas(
    folio INT,
    ordenPDF LONGBLOB,
    FOREIGN KEY (folio) REFERENCES ordenes(folio)
);

/* INSERT INTO cliente (nombreCliente,RFC,calle,numExt,numInt,colonia,delMun,ciudad,pais,cp,telCont,telHosp,email,ateDirec,cargo,numContrato,numLici,adminis,cargoDos,manteniBiomedica,cargoTres,usuario,cargoCuatro,ingTec,cargoCinco) VALUE ("YO","RFC1232","ASDASD",12,"DS","COLA","ASD","FWEFW","PAIS",123,12321,234234,"IMEIL","ATEDIREC","CARGO",12132,543,"AMD","CARGODOS","MANT","CARGOTRES","USU","CARGOCUATRO","INGTEC","CARGOCINCO");

SELECT * FROM cliente; */