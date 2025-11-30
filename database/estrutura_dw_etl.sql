-- Cria um schema separado exclusivo para o ETL
CREATE SCHEMA IF NOT EXISTS dw_etl;

-- Dimensao Localidade (ETL)
DROP TABLE IF EXISTS dw_etl.dim_localidade CASCADE;
CREATE TABLE dw_etl.dim_localidade (
    id_local INTEGER PRIMARY KEY, 
    municipio VARCHAR(100),
    bairro VARCHAR(100)
);

-- Dimensao Ocorrencia (ETL)
DROP TABLE IF EXISTS dw_etl.dim_ocorrencia CASCADE;
CREATE TABLE dw_etl.dim_ocorrencia (
    id_ocorrencia INTEGER PRIMARY KEY,
    origem_chamado VARCHAR(100),
    tipo VARCHAR(100),
    subtipo VARCHAR(100)
);

-- Dimensao Situacao (ETL)
DROP TABLE IF EXISTS dw_etl.dim_situacao CASCADE;
CREATE TABLE dw_etl.dim_situacao (
    id_situacao INTEGER PRIMARY KEY,
    motivo_finalizacao VARCHAR(255),
    motivo_desfecho VARCHAR(255)
);

-- Dimensao Paciente (ETL)
DROP TABLE IF EXISTS dw_etl.dim_paciente CASCADE;
CREATE TABLE dw_etl.dim_paciente (
    id_paciente INTEGER PRIMARY KEY,
    sexo VARCHAR(20),
    faixa_etaria VARCHAR(50)
);

-- Dimensao Tempo (ETL)
DROP TABLE IF EXISTS dw_etl.dim_tempo CASCADE;
CREATE TABLE dw_etl.dim_tempo (
    id_tempo INTEGER PRIMARY KEY,
    data_completa DATE,
    ano INTEGER,
    mes INTEGER,
    dia INTEGER,
    dia_semana VARCHAR(20),
    trimestre INTEGER,
    semestre INTEGER
);

-- Tabela Fato (ETL)
DROP TABLE IF EXISTS dw_etl.fato_atendimentos CASCADE;
CREATE TABLE dw_etl.fato_atendimentos (
    id_fato SERIAL PRIMARY KEY, -- O banco gera esse sequencial automatico
    
    -- Chaves Estrangeiras apontando para o schema dw_etl
    fk_local INTEGER REFERENCES dw_etl.dim_localidade(id_local),
    fk_ocorrencia INTEGER REFERENCES dw_etl.dim_ocorrencia(id_ocorrencia),
    fk_situacao INTEGER REFERENCES dw_etl.dim_situacao(id_situacao),
    fk_paciente INTEGER REFERENCES dw_etl.dim_paciente(id_paciente),
    fk_tempo INTEGER REFERENCES dw_etl.dim_tempo(id_tempo),
    
    -- Metricas
    hora_exata TIME,
    idade_paciente INTEGER,
    qtd_atendimentos INTEGER DEFAULT 1
);