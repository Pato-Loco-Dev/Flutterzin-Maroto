CREATE TABLE CONSULTAS(
COD_CONSULTA BIGINT PRIMARY KEY IDENTITY,
MOTIVO_CONSULTA VARCHAR(200),
DATA_CONSULTA DATE NOT NULL,
HORARIO_CONSULTA VARCHAR(5) NOT NULL,
PACIENTE BIGINT NOT NULL,
CONSTRAINT fk_paciente foreign key (PACIENTE) references PACIENTES (COD_PACIENTE)
)