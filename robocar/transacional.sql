SET DATESTYLE TO PostgreSQL,European;

CREATE SCHEMA Transacional;

--CREATE SEQUENCE Transacional.ID_VEICULO;
CREATE TABLE Transacional.veiculos(
  ID int GENERATED ALWAYS AS IDENTITY,
  DT_AQUISICAO date NOT NULL,
  MODELO varchar(50) NOT NULL,
  PLACA varchar(10) NOT NULL,
  STATUS varchar(15) NOT NULL,
  VL_DIARIA Numeric(10, 2) NOT null,
  primary key (id)
);

--CREATE SEQUENCE Transacional.ID_DESPACHANTE;
CREATE TABLE Transacional.despachantes(
  ID int GENERATED ALWAYS AS IDENTITY,
  NOME varchar(50) NOT NULL,
  FILIAL varchar(20) NOT NULL,
  STATUS varchar(8) NOT null,
  primary key (id)
);

--CREATE SEQUENCE Transacional.ID_CLIENTE;
CREATE TABLE Transacional.clientes(
  ID int GENERATED ALWAYS AS IDENTITY,
  CPF varchar(12) NOT NULL,
  CNH varchar(20) NOT NULL,
  DT_VALIDADE_CNH date NOT NULL,
  NOME varchar(50) NOT NULL,
  DT_CADASTRO timestamp NOT NULL,
  DT_NASCIMENTO date NOT NULL,
  TELEFONE varchar(20) NOT NULL,
  STATUS varchar(8) NOT null,
  primary key (id)
);

CREATE TABLE Transacional.locacao (
    ID int GENERATED ALWAYS AS IDENTITY,
	ID_DESPACHANTE int 
        CONSTRAINT fk_despachante
                REFERENCES Transacional.despachantes(ID) ON DELETE RESTRICT,
    ID_CLIENTE int 
        CONSTRAINT fk_clientes
                REFERENCES Transacional.clientes(ID) ON DELETE RESTRICT,
    ID_VEICULO int 
        CONSTRAINT fk_veiculo
                REFERENCES Transacional.veiculos(ID) ON DELETE RESTRICT,
    DT_LOCACAO date NOT NULL,
    DT_ENTREGA date NOT null,
    PRIMARY KEY (ID, ID_DESPACHANTE, ID_CLIENTE)
); 