CREATE DATABASE IF NOT EXISTS CLINICA;
USE CLINICA;

CREATE TABLE IF NOT EXISTS MEDICO(
ID_MEDICO INT(11) PRIMARY KEY NOT NULL,
NOME VARCHAR (100) NOT NULL,
CPF VARCHAR(20) NOT NULL,
ESPECIALIDADE VARCHAR(50) NOT NULL,
DATA_NASCIMENTO DATE NOT NULL,
ENDERECO VARCHAR(200) NOT NULL,
TELEFONE VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS CARGO(
ID_CARGO INT(11) PRIMARY KEY,
NOME VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS TIPO_EXAME(
ID_TIPO_EXAME INT(11) PRIMARY KEY,
TIPO VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS RESULTADO_EXAME(
ID_TIPO_RESULTADO_EXAME INT(11) PRIMARY KEY,
TIPO VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS RISCOS_OCUPACIONAIS(
ID_RISCOS INT(11) PRIMARY KEY,
NOME VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS ATESTADO(
ID_ATESTADO INT(11) PRIMARY KEY,
RESULTADOS_RISCOS VARCHAR(100) NOT NULL,
RESULTADO VARCHAR(100) NOT NULL,
OBSERVACOES VARCHAR(300) NOT NULL,
MEDICO INT NOT NULL,
CONSTRAINT MED_ATEST FOREIGN KEY(MEDICO) REFERENCES MEDICO(ID_MEDICO));

CREATE TABLE IF NOT EXISTS EXAME(
ID_EXAME INT(11) PRIMARY KEY,
ESPECIALIDADE VARCHAR(50) NOT NULL,
DATA_REALIZACAO DATE NOT NULL,
EXAME INT NOT NULL,
CONSTRAINT TIP_EXAM FOREIGN KEY (TIPO_EXAME) REFERENCES TIPO_EXAME(ID_TIPO_EXAME));

CREATE TABLE IF NOT EXISTS EMPRESA(
ID_EMPRESA INT(11) PRIMARY KEY,
CNPJ VARCHAR(20) NOT NULL,
NOME_FANTASIA VARCHAR(50) NOT NULL,
ENDEREÇO VARCHAR(20) NOT NULL,
TELEFONE VARCHAR(20) NOT NULL,
EMPRESA INT NOT NULL,
CONSTRAINT EMP_EMP FOREIGN KEY (EMPRESA) REFERENCES EMPRESA(EMPRESA_ID_EMPRESA));

CREATE TABLE IF NOT EXISTS FUNCIONARIO(
ID_FUNCIONARIO INT(11) PRIMARY KEY,
NOME VARCHAR(100) NOT NULL,
CPF VARCHAR (20) NOT NULL,
DATA_NASCIMENTO DATE NOT NULL,
ENDERECO VARCHAR(200),
TELEFONE VARCHAR(20) NOT NULL,
FUNCIONARIO INT NOT NULL,
CONSTRAINT CARGO_FUNC FOREIGN KEY (CARGO) REFERENCES CARGO(ID_CARGO),
CONSTRAINT EMRPESA_FUNC FOREIGN KEY (EMPRESA) REFERENCES EMPRESA(ID_EMPRESA));

CREATE TABLE IF NOT EXISTS EXAME_HAS_ATESTADO(
PRIMARY KEY (ID_EXAME, ID_ATESTADO),
CONSTRAINT EXAME_ATEST FOREIGN KEY(EXAME) REFERENCES EXAME (ID_EXAME),
CONSTRAINT ATEST_EXAME FOREIGN KEY(ATESTADO) REFERENCES ATESTADO(ID_ATESTADO));

CREATE TABLE IF NOT EXISTS EMRPESA_HAS_EXAME(
PRIMARY KEY (ID_EXAME, ID_EMPRESA),
CONSTRAINT EXAM_EMP FOREIGN KEY (EXAME) REFERENCES EXAME(ID_EXAME),
CONSTRAINT EMP_EXAM FOREIGN KEY (EMPRESA) REFERENCES EMPRESAS(ID_EMPRESA));

CREATE TABLE IF NOT EXISTS FUNCIONARIO_HAS_EXAME(
PRIMARY KEY (ID_EXAME, ID_FUNCIONARIO),
CONSTRAINT EXAME_FUNC FOREIGN KEY (EXAME) REFERENCES EXAME(ID_EXAME),
CONSTRAINT FUNC_EXAME FOREIGN KEY (FUNCIONARIO) REFERENCES FUNCIONARIO(ID_FUNCIONARIO));

CREATE TABLE IF NOT EXISTS CARGO_HAS_RISCOS_OCUPACIONAIS(
PRIMARY KEY (ID_CARGO, ID_RISCOS),
CONSTRAINT CARGO_RISCOS FOREIGN KEY(CARGO) REFERENCES CARGO(ID_CARGO),
CONSTRAINT RISCOS_CARGO FOREIGN KEY(RISCOS) REFERENCES RISCOS(ID_RISCOS));