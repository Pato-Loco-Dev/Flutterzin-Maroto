CREATE TABLE PACIENTES(
COD_PACIENTE BIGINT PRIMARY KEY IDENTITY,
NOME VARCHAR(70) NOT NULL,
TIPO_SANGUINEO VARCHAR(3),
DATA_NASCIMENTO DATE,
CONVENIO VARCHAR(3),
)