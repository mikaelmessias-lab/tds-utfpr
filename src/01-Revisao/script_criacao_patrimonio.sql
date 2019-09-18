CREATE DATABASE IF NOT EXISTS tds_revisao;

USE tds_revisao;

CREATE TABLE TB_CIDADE
(
CID_CODIGO INTEGER NOT NULL PRIMARY KEY,
CID_DESCRICAO VARCHAR(60) NOT NULL
);
CREATE UNIQUE INDEX UK_CIDADE ON TB_CIDADE(CID_DESCRICAO);

CREATE TABLE TB_BAIRRO
(
BAI_CODIGO INTEGER NOT NULL PRIMARY KEY,
BAI_DESCRICAO VARCHAR(60) NOT NULL
);
CREATE UNIQUE INDEX UK_BAIRRO ON TB_BAIRRO(BAI_DESCRICAO);


CREATE TABLE TB_ENDERECO
(
END_CODIGO INTEGER NOT NULL PRIMARY KEY,
END_DESCRICAO VARCHAR(60) NOT NULL
);
CREATE UNIQUE INDEX UK_ENDERECO ON TB_ENDERECO(END_DESCRICAO);

CREATE TABLE TB_DEPARTAMENTO
(
DEP_CODIGO INTEGER NOT NULL PRIMARY KEY,
DEP_DESCRICAO VARCHAR(60) NOT NULL
);
CREATE UNIQUE INDEX UK_DEPARTAMENTO ON TB_DEPARTAMENTO(DEP_DESCRICAO);

CREATE TABLE TB_TIPO
(
TIP_CODIGO INTEGER NOT NULL PRIMARY KEY,
TIP_DESCRICAO VARCHAR(60) NOT NULL
);
CREATE UNIQUE INDEX UK_TIPO ON TB_TIPO(TIP_DESCRICAO);

CREATE TABLE TB_MARCA
(
MAR_CODIGO INTEGER NOT NULL PRIMARY KEY,
MAR_DESCRICAO VARCHAR(60) NOT NULL
);
CREATE UNIQUE INDEX UK_MARCA ON TB_MARCA(MAR_DESCRICAO);

CREATE TABLE TB_PREDIO
(
PRE_CODIGO INTEGER NOT NULL PRIMARY KEY,
PRE_DESCRICAO VARCHAR(60) NOT NULL,
PRE_CODENDERECO INTEGER NOT NULL,
PRE_NUMERO VARCHAR(10),
PRE_CODBAIRRO INTEGER NOT NULL,
PRE_CODCIDADE INTEGER NOT NULL
);
CREATE UNIQUE INDEX UK_PREDIO ON TB_PREDIO(PRE_DESCRICAO);

ALTER TABLE `TB_PREDIO` ADD CONSTRAINT `fk_predio` FOREIGN KEY ( `PRE_CODENDERECO` ) REFERENCES `TB_ENDERECO` ( `END_CODIGO` ) ;
ALTER TABLE `TB_PREDIO` ADD CONSTRAINT `fk_bairro` FOREIGN KEY ( `PRE_CODBAIRRO` ) REFERENCES `TB_BAIRRO` ( `BAI_CODIGO` ) ;
ALTER TABLE `TB_PREDIO` ADD CONSTRAINT `fk_cidade` FOREIGN KEY ( `PRE_CODCIDADE` ) REFERENCES `TB_CIDADE` ( `CID_CODIGO` ) ;

CREATE TABLE TB_PATRIMONIO
(
PAT_CODIGO INTEGER NOT NULL PRIMARY KEY,
PAT_DESCRICAO VARCHAR(60) NOT NULL,
PAT_CODTIPO INTEGER NOT NULL REFERENCES TB_TIPO(TIP_CODIGO),
PAT_DATAFABRICACAO DATE NOT NULL,
PAT_DATAAQUISICAO DATE NOT NULL,
PAT_DATAELIMINACAO DATE,
PAT_VLRAQUISICAO DECIMAL(10,2),
PAT_OBS VARCHAR(100),
PAT_LOCALIZACAO VARCHAR(100),
PAT_CODMARCA INTEGER NOT NULL REFERENCES TB_MARCA(MAR_CODIGO),
PAT_CODDEPARTAMENTO INTEGER NOT NULL REFERENCES TB_DEPARTAMENTO(DEP_CODIGO),
PAT_CODPREDIO INTEGER NOT NULL REFERENCES TB_PREDIO(PRE_CODIGO)
);

ALTER TABLE `TB_PATRIMONIO` ADD CONSTRAINT `fk_tipo` FOREIGN KEY ( `PAT_CODTIPO` ) REFERENCES `TB_TIPO` ( `TIP_CODIGO` ) ;
ALTER TABLE `TB_PATRIMONIO` ADD CONSTRAINT `fk_marca` FOREIGN KEY ( `PAT_CODMARCA` ) REFERENCES `TB_MARCA` ( `MAR_CODIGO` ) ;
ALTER TABLE `TB_PATRIMONIO` ADD CONSTRAINT `fk_departamento` FOREIGN KEY ( `PAT_CODDEPARTAMENTO` ) REFERENCES `TB_DEPARTAMENTO` ( `DEP_CODIGO` ) ;
ALTER TABLE `TB_PATRIMONIO` ADD CONSTRAINT `fk_prediopatrimonio` FOREIGN KEY ( `PAT_CODPREDIO` ) REFERENCES `TB_PREDIO` ( `PRE_CODIGO` ) ;













