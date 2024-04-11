-- 1 PASSO: CRIAR A BASE DE DADOS (DATABASE OU SCHEMA):
CREATE DATABASE IF NOT EXISTS PROVA_CC1MC;
-- CRIAR DATABASE OU SCHEMA [IF NOT EXISTS] NOME;
-- IF NOT EXISTS: SE JÁ EXISTE, NÃO CRIE;

-- 2 PASSO: ABRIR A BASE DADOS PARA USO
USE PROVA_CC1MC;
-- USE NOME_BASE_DE_DADOS;

-- 3 PASSO: CRIAR AS TABELAS SEM CHAVE ESTRANGEIRA 
CREATE TABLE IF NOT EXISTS CLIENTES(
NUM_CLIENTE INT PRIMARY KEY,
NOME VARCHAR(50) NOT NULL
RUA_CLIENTE VARCHAR(100) NOT NULL,
NUMERO_RUA_CLIENTE INT,
BAIRRO_CLIENTE VARCHAR(100) NOT NULL,
CIDADE_CLIENTE VARCHAR(100) NOT NULL,
UF_CLIENTE CHAR(2) NOT NULL,
CEP_CLIENTE VARCHAR(9) NOT NULL
);

CREATE TABLE IF NOT EXISTS CARRO(
ID_CARRO INT PRIMARY KEY,
REGISTRO VARCHAR(20) NOT NULL,
MARCA VARCHAR(20) NOT NULL );

-- 4 PASSO: CRIAR AS TABELAS COM FK, POR ORDEM NECESSARIA 
CREATE TABLE IF NOT EXISTS APOLICES(
NUM_APOL INT PRIMARY KEY,
VALOR APOL DECIMAL(10,2) NOT NULL,
CLIENTE INT NOT NULL,
CARRO INT NOT NULL,
CONSTRAINT CLI_APOL FOREIGN KEY(CLIENTE) REFERENCES CLIENTE(NUM_CLIENTE),
CONTRAINT CAR_APO FOREING KEY (CLIENTE) REFERENCES APOLICE(NUM_APOLICE));

CREATE TABLE IF NOT EXISTS ACIDENTES(
ID_ACIDENTE INT AUTO_INCREMENT KEY,
DATA_ACIDENTE TIME NOT NULL,
RUA_ACIDENTE VARCHAR(100) NOT NULL,
NUMR_ACIDENTE INT,
BAIRRO_ACIDENTE VARCHAR(100) NOT NULL,
UF_ACIDENTE VARCHAR(2) NOT NULL,
CEP_ACIDENTE VARCHAR(9),
CLIENTE INT NOT NULL,
CONTRANTINT CLI_ACI FOREIGN KEY (CLIENTE) REFERENCES CLIENTE(NUM_CLIENTE)
);