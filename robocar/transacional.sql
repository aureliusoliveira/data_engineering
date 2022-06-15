SET DATESTYLE TO PostgreSQL,European;

CREATE SCHEMA Transacional;

CREATE SEQUENCE Transacional.ID_VEICULO;
CREATE TABLE Transacional.veiculos(
  ID int GENERATED ALWAYS AS IDENTITY,
  DT_AQUISICAO date NOT NULL,
  MODELO varchar(50) NOT NULL,
  PLACA varchar(10) NOT NULL,
  STATUS varchar(15) NOT NULL,
  VL_DIARIA Numeric(10, 2) NOT NULL
);

CREATE SEQUENCE Transacional.ID_DESPACHANTE;
CREATE TABLE Transacional.despachantes(
  ID int GENERATED ALWAYS AS IDENTITY,
  NOME varchar(50) NOT NULL,
  FILIAL varchar(20) NOT NULL,
  STATUS varchar(8) NOT NULL
);

CREATE SEQUENCE Transacional.ID_CLIENTE;
CREATE TABLE Transacional.clientes(
  ID int GENERATED ALWAYS AS IDENTITY,
  CPF varchar(12) NOT NULL,
  CNH varchar(20) NOT NULL,
  DT_VALIDADE_CNH date NOT NULL,
  NOME varchar(50) NOT NULL,
  DT_CADASTRO datetime NOT NULL,
  DT_NASCIMENTO date NOT NULL,
  TELEFONE varchar(20) NOT NULL,
  STATUS varchar(8) NOT NULL
);

CREATE TABLE Transacional.locacao (
    ID_DESPACHANTE int 
        CONSTRAINT fk_despachante
            FOREIGN KEY(ID_DESPACHANTE) 
                REFERENCES Transacional.despachantes(ID) ON DELETE RESTRICT,
    ID_CLIENTE int 
        CONSTRAINT fk_clientes
            FOREIGN KEY(ID_CLIENTE) 
                REFERENCES Transacional.clientes(ID) ON DELETE RESTRICT,
    ID_VEICULO int 
        CONSTRAINT fk_veiculo
            FOREIGN KEY(ID_VEICULO) 
                REFERENCES Transacional.veiculos(ID) ON DELETE RESTRICT,
    DT_LOCACAO datetime NOT NULL,
    DT_ENTREGA datetime NOT NULL
    PRIMARY KEY (ID_DESPACHANTE, ID_CLIENTE, ID_VEICULO)
); 